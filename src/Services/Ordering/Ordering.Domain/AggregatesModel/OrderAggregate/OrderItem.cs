using BuldingBlocks.SeedWork;
using Ordering.Domain.Exceptions;
using System;

namespace Ordering.Domain.AggregatesModel.OrderAggregate
{
    public class OrderItem : Entity
    {
        private string _productName;
        private decimal _productPrice;
        private int _amount;
        public int ProductId { get; private set; }
        protected OrderItem() { }
        public OrderItem(int productId, string productName, decimal productPrice, int amount)
        {
            this.ProductId = productId > 0 ? productId : throw new ArgumentException(nameof(productId));
            this._productName = !string.IsNullOrEmpty(productName) ? productName : throw new ArgumentNullException(nameof(productName));
            this._productPrice = productPrice > 0 ? productPrice : throw new ArgumentException(nameof(productPrice));
            this._amount = amount > 0 ? amount : throw new ArgumentException(nameof(amount));
        }

        public decimal CalculatePrice()
        {
            return this._amount * _productPrice;
        }

        public string GetProductName()
        {
            return _productName;
        }

        public decimal GetProductPrice()
        {
            return _productPrice;
        }

        public int GetAmount()
        {
            return _amount;
        }

        public void AddAmount(int amount)
        {
            if (amount == 0 || this._amount < amount) throw new OrderingDomainException("Invalid amount");
            this._amount += amount;
        }
    }
}
