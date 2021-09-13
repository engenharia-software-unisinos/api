using BuildingBlocks.EventBus.Events;
using System;

namespace Ordering.API.Application.IntegrationEvents.Events
{
    public record OrderStartedIntegrationEvent : IntegrationEvent
    {
        public OrderStartedIntegrationEvent(int orderId, Guid userId)
        {
            OrderId = orderId;
            UserId = userId;
        }

        public int OrderId { get; init; }
        public Guid UserId { get; init; }
    }
}
