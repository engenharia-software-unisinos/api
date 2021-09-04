using BuildingBlocks.EventBus.Events;

namespace Inventory.API.Application.IntegrationEvents.Events
{
    public record ItemStatusChangedToLockedIntegrationEvent : IntegrationEvent
    {
        public ItemStatusChangedToLockedIntegrationEvent(string userId, int itemId, string itemStatus)
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
