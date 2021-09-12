using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Ordering.API.Application.Queries
{
    public interface IOrderingQueries
    {
        Task<Item> GetItemAsync(int id);
        Task<IEnumerable<Item>> GetItemsFromUserAsync(Guid userId);
    }
}
