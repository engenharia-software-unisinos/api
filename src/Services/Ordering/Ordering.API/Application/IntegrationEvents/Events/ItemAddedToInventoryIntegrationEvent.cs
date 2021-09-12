using BuildingBlocks.EventBus.Events;
using System;

namespace Ordering.API.Application.IntegrationEvents.Events
{
    public record ItemAddedToInventoryIntegrationEvent : IntegrationEvent
    {
        public ItemAddedToInventoryIntegrationEvent(int itemId, Guid userId)
        {
            ItemId = itemId;
            UserId = userId;
        }

        public int ItemId { get; init; }
        public Guid UserId { get; init; }
    }
}
