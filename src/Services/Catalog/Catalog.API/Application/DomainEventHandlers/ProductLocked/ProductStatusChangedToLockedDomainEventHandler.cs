using BuildingBlocks.Identity;
using Catalog.API.Application.IntegrationEvents;
using Catalog.API.Application.IntegrationEvents.Events;
using Catalog.Domain.AggregatesModel.ProductAggregate;
using Catalog.Domain.Events;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Catalog.API.Application.DomainEventHandlers.ProductLocked
{
    public class ProductStatusChangedToLockedDomainEventHandler : INotificationHandler<ProductStatusChangedToLockedDomainEvent>
    {
        private readonly IProductRepository _itemRepository;
        private readonly IIdentityService _identityService;
        private readonly ILoggerFactory _logger;
        private readonly ICatalogIntegrationEventService _catalogIntegrationEventService;

        public ProductStatusChangedToLockedDomainEventHandler(IProductRepository itemRepository, IIdentityService identityService, ILoggerFactory logger, ICatalogIntegrationEventService catalogIntegrationEventService)
        {
            _itemRepository = itemRepository ?? throw new ArgumentNullException(nameof(itemRepository));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _catalogIntegrationEventService = catalogIntegrationEventService ?? throw new ArgumentNullException(nameof(catalogIntegrationEventService));
        }

        public async Task Handle(ProductStatusChangedToLockedDomainEvent notification, CancellationToken cancellationToken)
        {
            _logger.CreateLogger<ProductStatusChangedToLockedDomainEventHandler>()
                .LogTrace("Product with Id: {ProductId} has ben successfully updated to status {Status} ({Id}))",
                    notification.ProductId, nameof(ProductStatus.Locked), ProductStatus.Locked.Id);

            var item = await _itemRepository.GetAsync(notification.ProductId);

            var integrationEvent = new ProductStatusChangedToLockedIntegrationEvent(
                _identityService.GetUserIdentity(),
                item.Id,
                item.ProductStatus.Name);

            await _catalogIntegrationEventService.AddAndSaveEventAsync(integrationEvent);
        }
    }
}
