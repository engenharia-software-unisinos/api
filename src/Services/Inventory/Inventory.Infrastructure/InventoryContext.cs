using Inventory.Domain.AggregatesModel.ItemAggregate;
using Inventory.Domain.SeedWork;
using Inventory.Infrastructure.EntityConfigurations;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Inventory.Infrastructure
{
    public class InventoryContext : DbContext, IUnitOfWork
    {
        public const string DEFAULT_SCHEMA = "inventory";
        public DbSet<Item> Items { get; set; }
        public DbSet<ItemStatus> ItemStatus { get; set; }

        private readonly IMediator _mediator;
        private IDbContextTransaction _currentTransaction;

        public InventoryContext(DbContextOptions<InventoryContext> options) : base(options) { }

        public IDbContextTransaction GetCurrentTransaction() => _currentTransaction;

        public bool HasActiveTransaction => _currentTransaction != null;

        public InventoryContext(DbContextOptions<InventoryContext> options, IMediator mediator) : base(options)
        {
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));


            System.Diagnostics.Debug.WriteLine("InventoryContext::ctor ->" + this.GetHashCode());
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new ItemEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new ItemStatusEntityTypeConfiguration());
        }

        public async Task<bool> SaveEntitiesAsync(CancellationToken cancellationToken = default(CancellationToken))
        {
            await _mediator.DispatchDomainEventsAsync(this);

            ChangeTracker.Entries<Entity>()
                         .Where(e => e.State == EntityState.Modified).ToList()
                         .ForEach(e =>
                         {
                             e.Property("UpdatedAt").CurrentValue = DateTime.UtcNow;
                         });

            var result = await base.SaveChangesAsync(cancellationToken);
            return true;
        }

        public async Task<IDbContextTransaction> BeginTransactionAsync()
        {
            if (_currentTransaction != null) return null;

            _currentTransaction = await Database.BeginTransactionAsync(IsolationLevel.ReadCommitted);

            return _currentTransaction;
        }

        public async Task CommitTransactionAsync(IDbContextTransaction transaction)
        {
            if (transaction == null) throw new ArgumentNullException(nameof(transaction));
            if (transaction != _currentTransaction) throw new InvalidOperationException($"Transaction {transaction.TransactionId} is not current");

            try
            {
                await SaveChangesAsync();
                transaction.Commit();
            }
            catch
            {
                RollbackTransaction();
                throw;
            }
            finally
            {
                if (_currentTransaction != null)
                {
                    _currentTransaction.Dispose();
                    _currentTransaction = null;
                }
            }
        }

        public void RollbackTransaction()
        {
            try
            {
                _currentTransaction?.Rollback();
            }
            finally
            {
                if (_currentTransaction != null)
                {
                    _currentTransaction.Dispose();
                    _currentTransaction = null;
                }
            }
        }
    }

    public class InventoryContextDesignFactory : IDesignTimeDbContextFactory<InventoryContext>
    {
        public InventoryContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<InventoryContext>()
                .UseSqlServer("Server=.;Initial Catalog=Unisinos.EngSoftware.Inventory.Services.InventoryDb;Integrated Security=true");

            return new InventoryContext(optionsBuilder.Options, new NoMediator());
        }

        class NoMediator : IMediator
        {
            public Task Publish<TNotification>(TNotification notification, CancellationToken cancellationToken = default(CancellationToken)) where TNotification : INotification
            {
                return Task.CompletedTask;
            }

            public Task Publish(object notification, CancellationToken cancellationToken = default)
            {
                return Task.CompletedTask;
            }

            public Task<TResponse> Send<TResponse>(IRequest<TResponse> request, CancellationToken cancellationToken = default(CancellationToken))
            {
                return Task.FromResult<TResponse>(default(TResponse));
            }

            public Task<object> Send(object request, CancellationToken cancellationToken = default)
            {
                return Task.FromResult(default(object));
            }
        }
    }
}
