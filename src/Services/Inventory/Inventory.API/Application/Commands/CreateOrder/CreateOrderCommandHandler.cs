using Inventory.API.Application.IntegrationEvents;
using Inventory.API.Application.IntegrationEvents.Events;
using Inventory.API.Infrastructure.Services;
using Inventory.Domain.AggregatesModel.OrderAggregate;
using Inventory.Infrastructure.Idempotency;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Inventory.API.Application.Commands.CreateOrder
{
    public class CreateOrderCommandHandler : IRequestHandler<CreateOrderCommand, bool>
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IIdentityService _identityService;
        private readonly IInventoryIntegrationEventService _inventoryIntegrationEventService;
        private readonly ILogger<CreateOrderCommandHandler> _logger;

        public CreateOrderCommandHandler(IOrderRepository orderRepository, IIdentityService identityService, IInventoryIntegrationEventService inventoryIntegrationEventService, ILogger<CreateOrderCommandHandler> logger)
        {
            _orderRepository = orderRepository ?? throw new ArgumentNullException(nameof(orderRepository));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _inventoryIntegrationEventService = inventoryIntegrationEventService ?? throw new ArgumentNullException(nameof(inventoryIntegrationEventService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        public async Task<bool> Handle(CreateOrderCommand request, CancellationToken cancellationToken)
        {
            var userId = _identityService.GetUserIdentity();

            var integrationEvent = new OrderStartedIntegrationEvent(_identityService.GetUserIdentity());
            await _inventoryIntegrationEventService.AddAndSaveEventAsync(integrationEvent);

            var order = new Order(userId, request.Observation);

            foreach(var item in request.OrderItems)
            {
                order.AddOrderItem(item.ProductId, item.ProductName, item.ProductPrice, item.Amount);
            }

            _logger.LogInformation("---- Creating Order - Order: {@Order}", order);

            _orderRepository.Add(order);

            return await _orderRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        }
    }
}
