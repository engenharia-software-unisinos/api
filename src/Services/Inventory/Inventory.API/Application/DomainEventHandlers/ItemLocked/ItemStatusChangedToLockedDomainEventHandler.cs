using BuildingBlocks.Identity;
using Inventory.API.Application.IntegrationEvents;
using Inventory.API.Application.IntegrationEvents.Events;
using Inventory.Domain.AggregatesModel.ItemAggregate;
using Inventory.Domain.Events;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Inventory.API.Application.DomainEventHandlers.ItemLocked
{
    public class ItemStatusChangedToLockedDomainEventHandler : INotificationHandler<ItemStatusChangedToLockedDomainEvent>
    {
        private readonly IProductRepository _itemRepository;
        private readonly IIdentityService _identityService;
        private readonly ILoggerFactory _logger;
        private readonly IInventoryIntegrationEventService _inventoryIntegrationEventService;

        public ItemStatusChangedToLockedDomainEventHandler(IProductRepository itemRepository, IIdentityService identityService, ILoggerFactory logger, IInventoryIntegrationEventService inventoryIntegrationEventService)
        {
            _itemRepository = itemRepository ?? throw new ArgumentNullException(nameof(itemRepository));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _inventoryIntegrationEventService = inventoryIntegrationEventService ?? throw new ArgumentNullException(nameof(inventoryIntegrationEventService));
        }

        public async Task Handle(ItemStatusChangedToLockedDomainEvent notification, CancellationToken cancellationToken)
        {
            _logger.CreateLogger<ItemStatusChangedToLockedDomainEventHandler>()
                .LogTrace("Item with Id: {ItemId} has ben successfully updated to status {Status} ({Id}))",
                    notification.ItemId, nameof(ProductStatus.Locked), ProductStatus.Locked.Id);

            var item = await _itemRepository.GetAsync(notification.ItemId);

            var integrationEvent = new ItemStatusChangedToLockedIntegrationEvent(
                _identityService.GetUserIdentity(),
                item.Id,
                item.ProductStatus.Name);

            await _inventoryIntegrationEventService.AddAndSaveEventAsync(integrationEvent);
        }
    }
}
