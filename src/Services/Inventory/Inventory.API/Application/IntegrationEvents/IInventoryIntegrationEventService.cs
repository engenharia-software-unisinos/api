using BuildingBlocks.EventBus.Events;
using System;
using System.Threading.Tasks;

namespace Inventory.API.Application.IntegrationEvents
{
    public interface IInventoryIntegrationEventService
    {
        Task PublishEventsThroughEventBusAsync(Guid transactionId);
        Task AddAndSaveEventAsync(IntegrationEvent evt);
    }
}
