using BuildingBlocks.EventBus.Events;

namespace Inventory.API.Application.IntegrationEvents.Events
{
    public record ItemAddedToInventoryIntegrationEvent : IntegrationEvent
    {
        public ItemAddedToInventoryIntegrationEvent(int itemId, string userId)
        {
            ItemId = itemId;
            UserId = userId;
        }

        public int ItemId { get; init; }
        public string UserId { get; init; }
    }
}
