using MediatR;

namespace Inventory.Domain.Events
{
    public class ItemStatusChangedToOnStockDomainEvent : INotification
    {
        public ItemStatusChangedToOnStockDomainEvent(int id)
        {
            ItemId = id;
        }

        public int ItemId { get; }
    }
}
