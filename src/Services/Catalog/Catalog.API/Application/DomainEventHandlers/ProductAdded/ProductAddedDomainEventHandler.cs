using Catalog.API.Application.IntegrationEvents;
using Catalog.API.Application.IntegrationEvents.Events;
using Catalog.Domain.Events;
using MediatR;
using Microsoft.Extensions.Logging;
using System.Threading;
using System.Threading.Tasks;

namespace Catalog.API.Application.DomainEventHandlers.ProductAdded
{
    public class ProductAddedDomainEventHandler : INotificationHandler<ProductCreatedDomainEvent>
    {
        private readonly ILoggerFactory _logger;
        private readonly ICatalogIntegrationEventService _catalogIntegrationEventService;

        public ProductAddedDomainEventHandler(ILoggerFactory logger, ICatalogIntegrationEventService catalogIntegrationEventService)
        {
            _logger = logger;
            _catalogIntegrationEventService = catalogIntegrationEventService;
        }

        public async Task Handle(ProductCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            _logger.CreateLogger<ProductAddedDomainEventHandler>()
                .LogTrace("Product with Id: {ProductId} has ben successfully added to the catalog by user ({Owner})",
                    notification.Product.Id, notification.Product.Owner);

            var integrationEvent = new ProductAddedToCatalogIntegrationEvent(notification.Product.Id, notification.Product.Owner);

            await _catalogIntegrationEventService.AddAndSaveEventAsync(integrationEvent);
        }
    }
}
