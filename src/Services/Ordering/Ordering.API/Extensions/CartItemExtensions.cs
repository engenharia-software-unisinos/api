using Ordering.API.Application.Commands.CreateOrder;
using Ordering.API.Application.Models;
using System.Collections.Generic;

namespace Ordering.API.Extensions
{
    public static class CartItemExtensions
    {
        public static IEnumerable<OrderItemDTO> ToOrderItemsDTO(this IEnumerable<CartItem> cartItems)
        {
            foreach (var item in cartItems)
            {
                yield return item.ToOrderItemDTO();
            }
        }

        public static OrderItemDTO ToOrderItemDTO(this CartItem item)
        {
            return new OrderItemDTO
            {
                ProductId = item.ProductId,
                ProductName = item.ProductName,
                ProductPrice = item.ProductPrice,
                Amount = item.Amount
            };
        }
    }
}
