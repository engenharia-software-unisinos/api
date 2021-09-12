using BuildingBlocks.Identity;
using Inventory.Domain.AggregatesModel.OrderAggregate;
using MediatR;
using Microsoft.Extensions.Logging;
using System.Runtime.Serialization;
using System.Threading;
using System.Threading.Tasks;

namespace Inventory.API.Application.Commands.AddOrderItem
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
        public int ProductId { get; private set; }
        [DataMember]
        public string ProducName { get; private set; }
        [DataMember]
        public decimal ProductPrice { get; private set; }
        [DataMember]
        public int Amount { get; private set; }
    }

    public class AddOrderItemCommandHandler : IRequestHandler<AddOrderItemCommand, bool>
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IIdentityService _identityService;
        private readonly ILogger<AddOrderItemCommandHandler> _logger;

        public async Task<bool> Handle(AddOrderItemCommand request, CancellationToken cancellationToken)
        {
            var userId = _identityService.GetUserIdentity();

            return true;
        }
    }
}
