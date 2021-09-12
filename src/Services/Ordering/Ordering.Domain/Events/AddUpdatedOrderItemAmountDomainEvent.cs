using Ordering.Domain.AggregatesModel.OrderAggregate;
using MediatR;

namespace Ordering.Domain.Events
{
    public class AddUpdatedOrderItemAmountDomainEvent : INotification
    {
        public AddUpdatedOrderItemAmountDomainEvent(int orderId, OrderItem item)
        {
            OrderId = orderId;
            OrderItem = item;
        }
        public int OrderId { get; }
        public OrderItem OrderItem { get; }
    }
}
