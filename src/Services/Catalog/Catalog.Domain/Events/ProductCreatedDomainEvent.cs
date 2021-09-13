using Catalog.Domain.AggregatesModel.ProductAggregate;
using MediatR;

namespace Catalog.Domain.Events
{
    public class ProductCreatedDomainEvent : INotification
    {
        public ProductCreatedDomainEvent(ProductViewModels product)
        {
            Product = product;
        }

        public ProductViewModels Product { get;  }
    }
}
