using Inventory.Domain.SeedWork;
using System.Threading.Tasks;

namespace Inventory.Domain.AggregatesModel.ItemAggregate
{
    public interface IProductRepository : IRepository<Product>
    {
        Product Add(Product product);
        void Update(Product product);
        Task<Product> GetAsync(int productId);        
    }
}
