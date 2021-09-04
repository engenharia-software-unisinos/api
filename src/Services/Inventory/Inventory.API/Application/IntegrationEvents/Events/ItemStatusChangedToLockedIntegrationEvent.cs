using BuildingBlocks.EventBus.Events;
using System;

namespace Inventory.API.Application.IntegrationEvents.Events
{
    public record ItemStatusChangedToLockedIntegrationEvent : IntegrationEvent
    {
        public ItemStatusChangedToLockedIntegrationEvent(Guid userId, int itemId, string itemStatus)
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
