using Ordering.API.Application.Models;
using Ordering.API.Extensions;
using MediatR;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

namespace Ordering.API.Application.Commands.CreateOrder
{
    [DataContract]
    public class CreateOrderCommand : IRequest<bool>
    {
        [DataMember]
        public string Observation { get; init; }
        
        [DataMember]
        public IEnumerable<OrderItemDTO> OrderItems { get; init; }

        //[JsonConstructor]
        //public CreateOrderCommand(string observation, List<CartItem> cartItems)
        //{
        //    OrderItems = cartItems.ToOrderItemsDTO().ToList();
        //    Observation = observation;
        //}
        //
        [JsonConstructor]
        public CreateOrderCommand(string observation, IEnumerable<OrderItemDTO> orderItems)
        {
            OrderItems = orderItems;
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
