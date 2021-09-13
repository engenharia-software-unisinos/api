using BuldingBlocks.SeedWork;
using Catalog.Domain.Events;
using System;

namespace Catalog.Domain.AggregatesModel.ProductAggregate
{
    public class Product : Entity, IAggregateRoot
    {
        public string Code { get; private set; }
        public Guid Owner { get; private set; }
        public string Name { get; private set; }
        public decimal Price { get; private set; }
        public string Description { get; private set; }
        public int Amount { get; private set; }

        public ProductStatus ProductStatus { get; private set; }
        private int _productStatusId;

        protected Product() { }

        public Product(string code, Guid owner, string name, string description, decimal price, int amount) : this()
        {
            Code = !string.IsNullOrWhiteSpace(code) ? code : throw new ArgumentNullException(nameof(code));
            Owner = owner != Guid.Empty ? owner : throw new ArgumentNullException(nameof(owner));
            Name = !string.IsNullOrWhiteSpace(name) ? name : throw new ArgumentNullException(nameof(name));
            Description = !string.IsNullOrWhiteSpace(description) ? description : throw new ArgumentNullException(nameof(description));
            Price = price > 0 ? price : throw new ArgumentException(nameof(price));
            Amount = amount > 0 ? amount : throw new ArgumentException(nameof(amount));

            _productStatusId = ProductStatus.Avaiable.Id;

            AddDomainEvent(new ProductCreatedDomainEvent(this));
        }

        public void SetAvaiableStatus()
        {
            if (_productStatusId == ProductStatus.Locked.Id)
            {
                AddDomainEvent(new ProductStatusChangedToAvaiableDomainEvent(Id));

                _productStatusId = ProductStatus.Avaiable.Id;
            }
        }

        public void SetLockedStatus()
        {
            if (_productStatusId == ProductStatus.Avaiable.Id)
            {
                AddDomainEvent(new ProductStatusChangedToLockedDomainEvent(Id));

                _productStatusId = ProductStatus.Locked.Id;
            }
        }
    }
}
