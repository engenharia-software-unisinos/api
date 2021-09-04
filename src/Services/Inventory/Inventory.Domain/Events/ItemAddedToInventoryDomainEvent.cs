using Inventory.Domain.AggregatesModel.ItemAggregate;
using MediatR;

namespace Inventory.Domain.Events
{
    public class ItemAddedToInventoryDomainEvent : INotification
    {
        public ItemAddedToInventoryDomainEvent(Item item)
        {
            Item = item;
        }

        public Item Item { get; } 
    }
}
