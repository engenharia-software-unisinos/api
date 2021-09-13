using BuildingBlocks.Identity;
using Catalog.API.Application.IntegrationEvents;
using Catalog.API.Application.IntegrationEvents.Events;
using Catalog.Domain.AggregatesModel.ProductAggregate;
using Catalog.Domain.Events;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Catalog.API.Application.DomainEventHandlers.ProductAvaiable
{
    public class ProductStatusChangedToAvaiableDomainEventHandler : INotificationHandler<ProductStatusChangedToAvaiableDomainEvent>
    {
        private readonly IProductRepository _itemRepository;
        private readonly IIdentityService _identityService;
        private readonly ILoggerFactory _logger;
        private readonly ICatalogIntegrationEventService _catalogIntegrationEventService;

        public ProductStatusChangedToAvaiableDomainEventHandler(IProductRepository itemRepository, IIdentityService identityService, ILoggerFactory logger, ICatalogIntegrationEventService catalogIntegrationEventService)
        {
            _itemRepository = itemRepository ?? throw new ArgumentNullException(nameof(itemRepository));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _catalogIntegrationEventService = catalogIntegrationEventService ?? throw new ArgumentNullException(nameof(catalogIntegrationEventService));
        }

        public async Task Handle(ProductStatusChangedToAvaiableDomainEvent notification, CancellationToken cancellationToken)
        {
            _logger.CreateLogger<ProductStatusChangedToAvaiableDomainEventHandler>()
                .LogTrace("Product with Id: {ProductId} has ben successfully updated to status {Status} ({Id})",
                    notification.ProductId, nameof(ProductStatus.Avaiable), ProductStatus.Avaiable.Id);

            var item = await _itemRepository.GetAsync(notification.ProductId);

            var integrationEvent = new ProductStatusChangedToAvaiableIntegrationEvent(
                _identityService.GetUserIdentity(),
                item.Id,
                item.ProductStatus.Name);

            await _catalogIntegrationEventService.AddAndSaveEventAsync(integrationEvent);
        }
    }
}
