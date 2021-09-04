using BuildingBlocks.EventBus.Events;
using System;

namespace Inventory.API.Application.IntegrationEvents.Events
{
    public record ItemStatusChangedToOnStockIntegrationEvent : IntegrationEvent
    {
        public ItemStatusChangedToOnStockIntegrationEvent(Guid userId, int itemId, string itemStatus)
        {
            UserId = userId;
            ItemId = itemId;
            ItemStatus = itemStatus;
        }

        public Guid UserId { get; }
        public int ItemId { get; }
        public string ItemStatus { get; }

    }
}
