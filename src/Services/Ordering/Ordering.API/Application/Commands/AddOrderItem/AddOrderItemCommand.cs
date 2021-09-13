using BuildingBlocks.Identity;
using Ordering.Domain.AggregatesModel.OrderAggregate;
using MediatR;
using Microsoft.Extensions.Logging;
using System.Runtime.Serialization;
using System.Threading;
using System.Threading.Tasks;

namespace Ordering.API.Application.Commands.AddOrderItem
{
    [DataContract]
    public class AddOrderItemCommand : IRequest<bool>
    {
        public AddOrderItemCommand(int productId, string producName, decimal productPrice, int amount)
        {
            ProductId = productId;
            ProducName = producName;
            ProductPrice = productPrice;
            Amount = amount;
        }

        [DataMember]
        public int ProductId { get; init; }
        [DataMember]
        public string ProducName { get; init; }
        [DataMember]
        public decimal ProductPrice { get; init; }
        [DataMember]
        public int Amount { get; init; }
    }

    public class AddOrderItemCommandHandler : IRequestHandler<AddOrderItemCommand, bool>
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IIdentityService _identityService;
        private readonly ILogger<AddOrderItemCommandHandler> _logger;

        public AddOrderItemCommandHandler(IOrderRepository orderRepository, IIdentityService identityService, ILogger<AddOrderItemCommandHandler> logger)
        {
            _orderRepository = orderRepository;
            _identityService = identityService;
            _logger = logger;
        }

        public async Task<bool> Handle(AddOrderItemCommand request, CancellationToken cancellationToken)
        {
            var userId = _identityService.GetUserIdentity();

            return true;
        }
    }
}
