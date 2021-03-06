using BuildingBlocks.EventBus.Events;
using System;

namespace Catalog.API.Application.IntegrationEvents.Events
{
    public record ProductStatusChangedToAvaiableIntegrationEvent : IntegrationEvent
    {
        public ProductStatusChangedToAvaiableIntegrationEvent(Guid userId, int productId, string productStatus)
        {
            UserId = userId;
            ProductId = productId;
            ProductStatus = productStatus;
        }

        public Guid UserId { get; }
        public int ProductId { get; }
        public string ProductStatus { get; }
    }
}
