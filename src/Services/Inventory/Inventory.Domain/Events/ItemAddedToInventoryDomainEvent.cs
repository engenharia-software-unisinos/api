using Inventory.Domain.AggregatesModel.ItemAggregate;
using MediatR;

namespace Inventory.Domain.Events
{
    public class ItemAddedToInventoryDomainEvent : INotification
    {
        public ItemAddedToInventoryDomainEvent(Product item)
        {
            Item = item;
        }

        public Product Item { get; } 
    }
}
