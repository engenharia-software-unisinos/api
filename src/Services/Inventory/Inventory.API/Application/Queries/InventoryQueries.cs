﻿using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Inventory.API.Application.Queries
{
    public class InventoryQueries : IInventoryQueries
    {
        private string _connectionString = string.Empty;
        public InventoryQueries(string constr)
        {
            _connectionString = !string.IsNullOrWhiteSpace(constr) ? constr : throw new ArgumentNullException(nameof(constr));
        }

        public async Task<Item> GetItemAsync(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                var result = await connection.QueryAsync<Item>(@"SELECT * FROM inventory.items WHERE i.[Id]=@id", new { id });

                if (result.AsList().Count == 0)
                    throw new KeyNotFoundException();

                return result.First();
            }
        }

        public async Task<IEnumerable<Item>> GetItemsFromUserAsync(Guid userId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                return await connection.QueryAsync<Item>(@"SELECT * FROM inventory.items");
            }
        }
    }
}
