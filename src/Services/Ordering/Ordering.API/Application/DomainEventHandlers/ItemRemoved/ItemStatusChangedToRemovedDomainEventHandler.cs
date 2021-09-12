using BuildingBlocks.Identity;
using Ordering.API.Application.IntegrationEvents;
using Ordering.API.Application.IntegrationEvents.Events;
using Ordering.Domain.AggregatesModel.ItemAggregate;
using Ordering.Domain.Events;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Ordering.API.Application.DomainEventHandlers.ItemRemoved
{
    public class ItemStatusChangedToRemovedDomainEventHandler : INotificationHandler<ItemStatusChangedToRemovedDomainEvent>
    {
        private readonly IProductRepository _itemRepository;
        private readonly IIdentityService _identityService;
        private readonly ILoggerFactory _logger;
        private readonly IOrderingIntegrationEventService _inventoryIntegrationEventService;

        public ItemStatusChangedToRemovedDomainEventHandler(IProductRepository itemRepository, IIdentityService identityService, ILoggerFactory logger, IOrderingIntegrationEventService inventoryIntegrationEventService)
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
                    notification.ItemId, nameof(ProductStatus.Avaiable), ProductStatus.Avaiable.Id);

            var item = await _itemRepository.GetAsync(notification.ItemId);

            var integrationEvent = new ItemStatusChangedToOnStockIntegrationEvent(
                _identityService.GetUserIdentity(),
                item.Id,
                item.ProductStatus.Name);

            await _inventoryIntegrationEventService.AddAndSaveEventAsync(integrationEvent);
        }
    }
}
