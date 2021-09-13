using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Catalog.API.Application.Queries
{

    public class ProductQueries : IProductQueries
    {
        private string _connectionString = string.Empty;
        public ProductQueries(string constr)
        {
            _connectionString = !string.IsNullOrWhiteSpace(constr) ? constr : throw new ArgumentNullException(nameof(constr));
        }

        public async Task<IEnumerable<Product>> GetProductsAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                return await connection.QueryAsync<Product>(
                    @"SELECT 
                        [Id] as id, [Code] as code, [Owner] as owner, 
                        [Name] as name, [Description] as description, [Price] as price,
                        [Amount] as amount, [CreatedAt] as createdAt, [UpdatedAt] as updatedAt
                    FROM catalog.products");
            }
        }

        public async Task<Product> GetProductAsync(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                var result = await connection.QueryAsync<Product>(@"SELECT * FROM catalog.products p WHERE p.[Id]=@id", new { id });

                if (result.AsList().Count == 0)
                    throw new KeyNotFoundException();

                return result.First();
            }
        }

        public async Task<IEnumerable<ProductStatus>> GetProductStatusAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                return await connection.QueryAsync<ProductStatus>(@"SELECT * FROM catalog.product_status");
            }
        }
    }
}
