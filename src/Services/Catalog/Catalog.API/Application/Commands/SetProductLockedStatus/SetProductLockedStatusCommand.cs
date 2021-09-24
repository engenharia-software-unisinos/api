using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;

namespace Catalog.API.Application.Commands.SetProductLockedStatus
{
    public class SetProductLockedStatusCommand : IRequest<bool>
    {
        public SetProductLockedStatusCommand(int productId)
        {
            ProductId = productId;
        }

        [DataMember]
        public int ProductId { get; init; }
    }
}
