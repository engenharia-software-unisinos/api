using BuldingBlocks.SeedWork;
using System.Threading.Tasks;

namespace Catalog.Domain.AggregatesModel.ProductAggregate
{
    public interface IProductRepository : IRepository<ProductViewModels>
    {
        ProductViewModels Add(ProductViewModels product);
        void Update(ProductViewModels product);
        Task<ProductViewModels> GetAsync(int productId);
    }
}
