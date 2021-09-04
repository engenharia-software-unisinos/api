using Inventory.API.Application.Models;
using Inventory.API.Extensions;
using MediatR;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;

namespace Inventory.API.Application.Commands.CreateOrder
{
    [DataContract]
    public class CreateOrderCommand : IRequest<bool>
    {
        [DataMember]
        public string Observation { get; private set; }
        
        [DataMember]
        private readonly List<OrderItemDTO> _orderItems;
        
        [DataMember]
        public IEnumerable<OrderItemDTO> OrderItems => _orderItems;

        public CreateOrderCommand()
        {
            _orderItems = new List<OrderItemDTO>();
        }

        public CreateOrderCommand(string observation, List<CartItem> cartItems)
        {
            _orderItems = cartItems.ToOrderItemsDTO().ToList();
            Observation = observation;
        }
    }

    public record OrderItemDTO
    {
        public int ProductId { get; init; }
        public string ProductName { get; init; }
        public decimal ProductPrice { get; init; }
        public int Amount { get; init; }
    }
}
