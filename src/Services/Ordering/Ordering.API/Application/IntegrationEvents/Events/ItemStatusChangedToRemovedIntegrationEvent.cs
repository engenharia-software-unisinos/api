using BuildingBlocks.EventBus.Events;

namespace Ordering.API.Application.IntegrationEvents.Events
{
    public record ItemStatusChangedToRemovedIntegrationEvent : IntegrationEvent
    {
        public ItemStatusChangedToRemovedIntegrationEvent(string userId, int itemId, string itemStatus)
        {
            UserId = userId;
            ItemId = itemId;
            ItemStatus = itemStatus;
        }

        public string UserId { get; }
        public int ItemId { get; }
        public string ItemStatus { get; }

    }
}
