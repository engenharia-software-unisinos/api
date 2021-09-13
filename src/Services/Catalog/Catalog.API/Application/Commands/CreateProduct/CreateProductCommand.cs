using Catalog.Domain.AggregatesModel.ProductAggregate;
using MediatR;
using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

namespace Catalog.API.Application.Commands.CreateProduct
{
    [DataContract]
    public class CreateProductCommand : IRequest<ProductDTO>
    {
        [JsonConstructor]
        public CreateProductCommand(string code, string name, string description, decimal price, int amount)
        {
            this.Code = code;
            this.Name = name;
            this.Description = description;
            this.Price = price;
            this.Amount = amount;
        }

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
}
