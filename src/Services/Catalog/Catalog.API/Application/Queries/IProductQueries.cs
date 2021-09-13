using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Catalog.API.Application.Queries
{
    public interface IProductQueries
    {
        Task<IEnumerable<Product>> GetProductsAsync();
        Task<Product> GetProductAsync(int id);
        Task<IEnumerable<ProductStatus>> GetProductStatusAsync();

    }
}
