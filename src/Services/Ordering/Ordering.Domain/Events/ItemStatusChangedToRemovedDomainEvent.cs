using MediatR;

namespace Ordering.Domain.Events
{
    public class ItemStatusChangedToRemovedDomainEvent : INotification
    {
        public ItemStatusChangedToRemovedDomainEvent(int id)
        {
            ItemId = id;
        }

        public int ItemId { get; }
    }
}
