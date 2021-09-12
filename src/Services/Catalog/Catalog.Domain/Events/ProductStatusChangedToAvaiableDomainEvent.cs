using MediatR;

namespace Catalog.Domain.Events
{
    public class ProductStatusChangedToAvaiableDomainEvent : INotification
    {
        public ProductStatusChangedToAvaiableDomainEvent(int productId)
        {
            ProductId = productId;
        }

        public int ProductId { get; }
    }
}
