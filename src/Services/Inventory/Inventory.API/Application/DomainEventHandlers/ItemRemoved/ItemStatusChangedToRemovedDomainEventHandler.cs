using Inventory.API.Application.IntegrationEvents;
using Inventory.API.Application.IntegrationEvents.Events;
using Inventory.API.Infrastructure.Services;
using Inventory.Domain.AggregatesModel.ItemAggregate;
using Inventory.Domain.Events;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Inventory.API.Application.DomainEventHandlers.ItemRemoved
{
    public class ItemStatusChangedToRemovedDomainEventHandler : INotificationHandler<ItemStatusChangedToRemovedDomainEvent>
    {
        private readonly IItemRepository _itemRepository;
        private readonly IIdentityService _identityService;
        private readonly ILoggerFactory _logger;
        private readonly IInventoryIntegrationEventService _inventoryIntegrationEventService;

        public ItemStatusChangedToRemovedDomainEventHandler(IItemRepository itemRepository, IIdentityService identityService, ILoggerFactory logger, IInventoryIntegrationEventService inventoryIntegrationEventService)
        {
            _itemRepository = itemRepository ?? throw new ArgumentNullException(nameof(itemRepository));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _inventoryIntegrationEventService = inventoryIntegrationEventService ?? throw new ArgumentNullException(nameof(inventoryIntegrationEventService));
        }

        public async Task Handle(ItemStatusChangedToRemovedDomainEvent notification, CancellationToken cancellationToken)
        {
            _logger.CreateLogger<ItemStatusChangedToRemovedDomainEventHandler>()
                .LogTrace("Item with Id: {ItemId} has ben successfully updated to status {Status} ({Id})",
                    notification.ItemId, nameof(ItemStatus.OnStock), ItemStatus.OnStock.Id);

            var item = await _itemRepository.GetAsync(notification.ItemId);

            var integrationEvent = new ItemStatusChangedToOnStockIntegrationEvent(
                _identityService.GetUserIdentity(),
                item.Id,
                item.ItemStatus.Name);

            await _inventoryIntegrationEventService.AddAndSaveEventAsync(integrationEvent);
        }
    }
}
