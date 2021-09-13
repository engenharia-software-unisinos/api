using BuldingBlocks.SeedWork;
using Catalog.Domain.AggregatesModel.ProductAggregate;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace Catalog.Infrastructure.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly CatalogContext _context;

        public IUnitOfWork UnitOfWork
        {
            get
            {
                return _context;
            }
        }

        public ProductRepository(CatalogContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public Product Add(Product item)
        {
            return _context.Products.Add(item).Entity;
        }

        public async Task<Product> GetAsync(int productId)
        {
            return await _context.Products.FirstOrDefaultAsync(x => x.Id == productId);
        }

        public void Update(Product item)
        {
            _context.Entry(item).State = EntityState.Modified;
        }
    }
}
