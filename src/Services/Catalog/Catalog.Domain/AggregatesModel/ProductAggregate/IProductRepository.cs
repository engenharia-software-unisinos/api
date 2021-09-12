using BuldingBlocks.SeedWork;
using System.Threading.Tasks;

namespace Catalog.Domain.AggregatesModel.ProductAggregate
{
    public interface IProductRepository : IRepository<Product>
    {
        Product Add(Product product);
        void Update(Product product);
        Task<Product> GetAsync(int productId);
    }
}
