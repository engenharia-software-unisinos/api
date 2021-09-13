using MediatR;
using Microsoft.Extensions.Logging;
using Ordering.API.Application.IntegrationEvents;
using Ordering.API.Application.IntegrationEvents.Events;
using Ordering.Domain.Events;
using System.Threading;
using System.Threading.Tasks;

namespace Ordering.API.Application.DomainEventHandlers
{
    public class OrderStartedDomainEventHandler : INotificationHandler<OrderStartedDomainEvent>
    {
        private readonly ILoggerFactory _logger;
        private readonly IOrderingIntegrationEventService _orderingIntegrationEventService;

        public OrderStartedDomainEventHandler(ILoggerFactory logger, IOrderingIntegrationEventService orderingIntegrationEventService)
        {
            _logger = logger;
            _orderingIntegrationEventService = orderingIntegrationEventService;
        }

        public async Task Handle(OrderStartedDomainEvent notification, CancellationToken cancellationToken)
        {
            _logger.CreateLogger<OrderStartedDomainEventHandler>()
                .LogTrace("Order with Id: {OrderId} has ben successfully added to the catalog by user ({Owner})",
                    notification.Order.Id, notification.Order.BuyerId);

            var integrationEvent = new OrderStartedIntegrationEvent(notification.Order.Id, notification.Order.BuyerId);

            await _orderingIntegrationEventService.AddAndSaveEventAsync(integrationEvent);
        }
    }
}
