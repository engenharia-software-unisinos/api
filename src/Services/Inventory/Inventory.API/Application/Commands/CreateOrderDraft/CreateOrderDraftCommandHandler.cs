using Inventory.API.Application.Commands.CreateOrder;
using Inventory.API.Extensions;
using Inventory.Domain.AggregatesModel.OrderAggregate;
using MediatR;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Inventory.API.Application.Commands.CreateOrderDraft
{
    public class CreateOrderDraftCommandHandler : IRequestHandler<CreateOrderDraftCommand, OrderDraftDTO>
    {
        public CreateOrderDraftCommandHandler() { }

        public Task<OrderDraftDTO> Handle(CreateOrderDraftCommand request, CancellationToken cancellationToken)
        {
            var order = Order.NewDraft();
            var orderItems = request.CartItems.Select(x => x.ToOrderItemDTO());

            foreach(var item in orderItems)
            {
                order.AddOrderItem(item.ProductId, item.ProductName, item.ProductPrice, item.Amount);
            }

            return Task.FromResult(OrderDraftDTO.FromOrder(order));

        }
    }

    public record OrderDraftDTO
    {
        public IEnumerable<OrderItemDTO> OrderItems { get; init; }
        public decimal TotalPrice { get; init; }
        public static OrderDraftDTO FromOrder(Order order)
        {
            return new OrderDraftDTO()
            {
                OrderItems = order.OrderItems.Select(x => new OrderItemDTO
                {
                    ProductId = x.ProductId,
                    ProductName = x.GetProductName(),
                    ProductPrice = x.GetProductPrice(),
                    Amount = x.GetAmount()
                }),
                TotalPrice = order.GetTotalPrice()
            };
        }
    }
}
