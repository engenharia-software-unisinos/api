using Inventory.Domain.AggregatesModel.OrderAggregate;
using MediatR;

namespace Inventory.Domain.Events
{
    public class RemovedOrderItemDomainEvent : INotification
    {
        public RemovedOrderItemDomainEvent(int orderId, OrderItem item)
        {
            OrderId = orderId;
            OrderItem = item;
        }
        public int OrderId { get; }
        public OrderItem OrderItem { get; }
    }
}
