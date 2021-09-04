using Inventory.API.Application.IntegrationEvents;
using Inventory.API.Application.IntegrationEvents.Events;
using Inventory.Domain.AggregatesModel.ItemAggregate;
using Inventory.Domain.Events;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Inventory.API.Application.DomainEventHandlers.ItemAdded
{
    public class ItemAddedToInventoryDomainEventHandler : INotificationHandler<ItemAddedToInventoryDomainEvent>
    {
        private readonly ILoggerFactory _logger;
        private readonly IInventoryIntegrationEventService _inventoryIntegrationEventService;

        public ItemAddedToInventoryDomainEventHandler(ILoggerFactory logger, IInventoryIntegrationEventService inventoryIntegrationEventService)
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
