using Ordering.Domain.AggregatesModel.OrderAggregate;
using MediatR;

namespace Ordering.Domain.Events
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
