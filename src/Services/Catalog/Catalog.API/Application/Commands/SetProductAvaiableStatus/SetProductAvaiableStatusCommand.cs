using MediatR;
using System.Runtime.Serialization;

namespace Catalog.API.Application.Commands.SetProductAvaiableStatus
{
    public class SetProductAvaiableStatusCommand : IRequest<bool>
    {
        public SetProductAvaiableStatusCommand(int productId)
        {
            ProductId = productId;
        }

        [DataMember]
        public int ProductId { get; init; }
    }
}
