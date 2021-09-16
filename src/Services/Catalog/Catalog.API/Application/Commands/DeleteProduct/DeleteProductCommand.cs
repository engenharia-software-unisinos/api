using MediatR;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Catalog.API.Application.Commands.DeleteProduct
{
    public class DeleteProductCommand : IRequest<bool>
    {
        public DeleteProductCommand(int productId)
        {
            ProductId = productId;
        }

        [DataMember]
        [Required]
        public int ProductId { get; init; }
    }
}
