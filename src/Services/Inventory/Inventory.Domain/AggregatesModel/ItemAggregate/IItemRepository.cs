using Inventory.Domain.SeedWork;
using System.Threading.Tasks;

namespace Inventory.Domain.AggregatesModel.ItemAggregate
{
    public interface IItemRepository : IRepository<Item>
    {
        Item Add(Item item);
        void Update(Item item);
        Task<Item> GetAsync(int itemId);        
    }
}
