using Ordering.Domain.Events;
using Ordering.Domain.SeedWork;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Ordering.Domain.AggregatesModel.OrderAggregate
{
    public class Order : Entity, IAggregateRoot
    {
        public static Order NewDraft()
        {
            var order = new Order();
            order._isDraft = true;
            return order;
        }

        public Guid BuyerId { get; private set; }  
        public string Observation { get; private set; }
        public OrderStatus OrderStatus { get; private set; }
        private int _orderStatusId;

        private readonly List<OrderItem> _orderItems;
        public IReadOnlyCollection<OrderItem> OrderItems => _orderItems.AsReadOnly();

        private bool _isDraft;

        protected Order() { this._orderItems = new List<OrderItem>(); }
        
        public Order(Guid buyerId, string observation) : this()
        {
            this.BuyerId = buyerId != Guid.Empty ? buyerId : throw new ArgumentNullException(nameof(buyerId));
            this.Observation = observation;
            this._orderStatusId = OrderStatus.Pending.Id;

            AddOrderStartedDomainEvent();
        }

        public void AddOrderItem(int productId, string productName, decimal productPrice, int amount = 1)
        {
            var existingOrderItem = this._orderItems.Where(x => x.ProductId == productId).SingleOrDefault();

            if (existingOrderItem != null)
            {
                if (existingOrderItem.GetAmount() > existingOrderItem.GetAmount() - amount)
                {
                    existingOrderItem.AddAmount(amount);
                    AddUpdatedOrderItemAmountDomainEvent(existingOrderItem);
                }
                else
                {
                    _orderItems.Remove(existingOrderItem);
                    AddRemovedOrderItemDomainEvent(existingOrderItem);
                }
            }
            else
            {
                var orderItem = new OrderItem(productId, productName, productPrice, amount);
                this._orderItems.Add(orderItem);

                AddAddedOrderItemDomainEvent(orderItem);
            }
        }

        public decimal GetTotalPrice()
        {
            return _orderItems.Sum(x => x.CalculatePrice());
        }

        private void AddOrderStartedDomainEvent()
        {
            this.AddDomainEvent(new OrderStartedDomainEvent(this));
        }

        private void AddAddedOrderItemDomainEvent(OrderItem orderItem)
        {
            this.AddDomainEvent(new AddedOrderItemDomainEvent(this.Id, orderItem));
        }

        private void AddUpdatedOrderItemAmountDomainEvent(OrderItem orderItem)
        {
            this.AddDomainEvent(new AddUpdatedOrderItemAmountDomainEvent(this.Id, orderItem));
        }

        private void AddRemovedOrderItemDomainEvent(OrderItem orderItem)
        {
            this.AddDomainEvent(new RemovedOrderItemDomainEvent(this.Id, orderItem));
        }
    }
}
