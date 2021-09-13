using Catalog.Domain.AggregatesModel.ProductAggregate;
using MediatR;
using System;

namespace Catalog.API.Application.Commands.CreateProduct
{
    public class CreateProductCommand : IRequest<ProductDTO>
    {
        public CreateProductCommand(string code, string name, string description, decimal price, int amount)
        {
            Code = code;
            Name = name;
            Description = description;
            Price = price;
            this.Amount = amount;
        }

        public string Code { get; private set; }
        public string Name { get; private set; }
        public string Description { get; private set; }
        public decimal Price { get; private set; }
        public int Amount { get; private set; }
    }   
}
