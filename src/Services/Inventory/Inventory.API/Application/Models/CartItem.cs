using Inventory.API.Application.Commands.CreateOrder;
using System.Collections.Generic;

namespace Inventory.API.Application.Models
{
    public record CartItem
    {
        public string Id { get; init; }
        public int ProductId { get; init; }
        public string ProductName { get; init; }
        public decimal ProductPrice { get; init; }
        public int Amount { get; init; }
    }
}
