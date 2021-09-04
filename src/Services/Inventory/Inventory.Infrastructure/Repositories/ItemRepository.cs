using Inventory.Domain.AggregatesModel.ItemAggregate;
using Inventory.Domain.SeedWork;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace Inventory.Infrastructure.Repositories
{
    public class ItemRepository : IProductRepository
    {
        private readonly InventoryContext _context;

        public IUnitOfWork UnitOfWork
        {
            get
            {
                return _context;
            }
        }

        public ItemRepository(InventoryContext context)
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
