using Inventory.API.Application.Commands.CreateOrder;
using Inventory.API.Application.Models;
using Inventory.API.Infrastructure.Services;
using Inventory.Domain.AggregatesModel.OrderAggregate;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Inventory.API.Application.Commands.CreateOrderDraft
{
    public class CreateOrderDraftCommand : IRequest<OrderDraftDTO>
    {
        public CreateOrderDraftCommand(IEnumerable<CartItem> cartItems)
        {
            CartItems = cartItems;
        }

        public IEnumerable<CartItem> CartItems { get; private set; }
    }      
}
