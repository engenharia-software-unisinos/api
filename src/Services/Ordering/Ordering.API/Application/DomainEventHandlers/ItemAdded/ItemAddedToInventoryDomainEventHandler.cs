using Ordering.API.Application.IntegrationEvents;
using Ordering.API.Application.IntegrationEvents.Events;
using Ordering.Domain.Events;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Ordering.API.Application.DomainEventHandlers.ItemAdded
{
    public class ItemAddedToInventoryDomainEventHandler : INotificationHandler<ItemAddedToInventoryDomainEvent>
    {
        private readonly ILoggerFactory _logger;
        private readonly IOrderingIntegrationEventService _inventoryIntegrationEventService;

        public ItemAddedToInventoryDomainEventHandler(ILoggerFactory logger, IOrderingIntegrationEventService inventoryIntegrationEventService)
        {
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _inventoryIntegrationEventService = _inventoryIntegrationEventService ?? throw new ArgumentNullException(nameof(_inventoryIntegrationEventService));
        }

        public async Task Handle(ItemAddedToInventoryDomainEvent notification, CancellationToken cancellationToken)
        {
            _logger.CreateLogger<ItemAddedToInventoryDomainEventHandler>()
                .LogTrace("Item with Id: {ItemId} has ben successfully added to the inventory by identity ({Identity})",
                    notification.Item.Id, notification.Item.Identity);

            var integrationEvent = new ItemAddedToInventoryIntegrationEvent(notification.Item.Id, notification.Item.Identity);

            await _inventoryIntegrationEventService.AddAndSaveEventAsync(integrationEvent);
        }
    }
}
