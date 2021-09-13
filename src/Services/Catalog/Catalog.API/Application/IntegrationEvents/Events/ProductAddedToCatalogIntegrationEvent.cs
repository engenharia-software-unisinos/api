using BuildingBlocks.EventBus.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Catalog.API.Application.IntegrationEvents.Events
{
    public record ProductAddedToCatalogIntegrationEvent : IntegrationEvent
    {
        public ProductAddedToCatalogIntegrationEvent(int productId, Guid userId)
        {
            ProductId = productId;
            UserId = userId;
        }

        public int ProductId { get; init; }
        public Guid UserId { get; init; }
    }
}
