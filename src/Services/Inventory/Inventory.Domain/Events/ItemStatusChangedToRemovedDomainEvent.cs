using MediatR;

namespace Inventory.Domain.Events
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
