using BuildingBlocks.EventBus.Events;

namespace Inventory.API.Application.IntegrationEvents.Events
{
    public record ItemStatusChangedToOnStockIntegrationEvent : IntegrationEvent
    {
        public ItemStatusChangedToOnStockIntegrationEvent(string userId, int itemId, string itemStatus)
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
