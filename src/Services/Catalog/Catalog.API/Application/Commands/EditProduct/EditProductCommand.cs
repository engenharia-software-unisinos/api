using MediatR;
using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Catalog.API.Application.Commands.EditProduct
{
    public class EditProductCommand : IRequest<bool>
    {
        public EditProductCommand(int productId, ProductDTO product)
        {
            this.ProductId = productId;
            this.Code = product.code;
            this.Name = product.name;
            this.Description = product.description;
            this.Price = product.price;
            this.Amount = product.amount;
        }

        [DataMember]
        [Required]
        public int ProductId { get; init; }

        [DataMember]
        [Required]
        public string Code { get; init; }
        [DataMember]
        [Required]
        public string Name { get; init; }
        [DataMember]
        public string Description { get; init; }
        [DataMember]
        [Required]
        public decimal Price { get; init; }
        [DataMember]
        [Required]
        public int Amount { get; init; }
    }

    public record ProductDTO
    {
        public string code { get; init; }
        public string name { get; init; }
        public string description { get; init; }
        public decimal price { get; init; }
        public int amount { get; init; }
    }
}
