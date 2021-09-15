using Catalog.Domain.AggregatesModel.ProductAggregate;
using MediatR;

namespace Catalog.Domain.Events
{
    public class ProductCreatedDomainEvent : INotification
    {
        public ProductCreatedDomainEvent(Product product)
        {
            Product = product;
        }

        public Product Product { get;  }
    }
}
