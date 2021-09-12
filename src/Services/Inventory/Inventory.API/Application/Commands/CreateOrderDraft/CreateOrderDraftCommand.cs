﻿using Inventory.API.Application.Models;
using MediatR;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Inventory.API.Application.Commands.CreateOrderDraft
{
    [DataContract]
    public class CreateOrderDraftCommand : IRequest<OrderDraftDTO>
    {
        public CreateOrderDraftCommand(IEnumerable<CartItem> cartItems)
        {
            CartItems = cartItems;
        }

        [DataMember]
        public IEnumerable<CartItem> CartItems { get; private set; }
    }      
}
