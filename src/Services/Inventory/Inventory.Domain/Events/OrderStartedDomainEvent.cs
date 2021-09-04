using Inventory.Domain.AggregatesModel.OrderAggregate;
using MediatR;

namespace Inventory.Domain.Events
{
    public class OrderStartedDomainEvent : INotification
    {
        public OrderStartedDomainEvent(Order order)
        {
            Order = order;
        }

        public Order Order { get; }
    }
}
