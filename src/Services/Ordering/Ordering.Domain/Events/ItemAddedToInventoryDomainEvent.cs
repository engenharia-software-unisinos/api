using Ordering.Domain.AggregatesModel.ItemAggregate;
using MediatR;

namespace Ordering.Domain.Events
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
