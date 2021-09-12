using Ordering.Domain.AggregatesModel.ItemAggregate;
using Ordering.Domain.SeedWork;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace Ordering.Infrastructure.Repositories
{
    public class ItemRepository : IProductRepository
    {
        private readonly OrderingContext _context;

        public IUnitOfWork UnitOfWork
        {
            get
            {
                return _context;
            }
        }

        public ItemRepository(OrderingContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public Product Add(Product item)
        {
            return _context.Items.Add(item).Entity;
        }

        public async Task<Product> GetAsync(int itemId)
        {
            return await _context.Items.FirstOrDefaultAsync(x => x.Id == itemId);
        }

        public void Update(Product item)
        {
            _context.Entry(item).State = EntityState.Modified;
        }
    }
}
