using MediatR;

namespace Ordering.Domain.Events
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
