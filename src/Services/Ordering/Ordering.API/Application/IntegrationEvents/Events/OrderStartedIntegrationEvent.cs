using BuildingBlocks.EventBus.Events;
using System;

namespace Ordering.API.Application.IntegrationEvents.Events
{
    public record OrderStartedIntegrationEvent : IntegrationEvent
    {
        public OrderStartedIntegrationEvent(Guid userId)
        {
            UserId = userId;
        }

        public Guid UserId { get; init; }
    }
}
