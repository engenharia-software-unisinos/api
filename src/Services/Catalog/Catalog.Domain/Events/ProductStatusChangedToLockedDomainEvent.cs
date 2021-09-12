using MediatR;

namespace Catalog.Domain.Events
{
    public class ProductStatusChangedToLockedDomainEvent : INotification
    {
        public ProductStatusChangedToLockedDomainEvent(int productId)
        {
            ProductId = productId;
        }

        public int ProductId { get; }
    }
}
