using BuildingBlocks.EventBus.Events;
using System;
using System.Threading.Tasks;

namespace Catalog.API.Application.IntegrationEvents
{
    public interface ICatalogIntegrationEventService
    {
        Task PublishEventsThroughEventBusAsync(Guid transactionId);
        Task AddAndSaveEventAsync(IntegrationEvent evt);
    }
}
