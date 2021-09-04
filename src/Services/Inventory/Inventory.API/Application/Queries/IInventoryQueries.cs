using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Inventory.API.Application.Queries
{
    public interface IInventoryQueries
    {
        Task<Item> GetItemAsync(int id);
        Task<IEnumerable<Item>> GetItemsFromUserAsync(Guid userId);
    }
}
