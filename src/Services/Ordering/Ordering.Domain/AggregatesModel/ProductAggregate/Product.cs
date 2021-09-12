using Ordering.Domain.Events;
using Ordering.Domain.SeedWork;
using System;

namespace Ordering.Domain.AggregatesModel.ItemAggregate
{
    public class Product : Entity, IAggregateRoot
    {
        public string Code { get; private set; }
        public Guid Identity { get; private set; }
        public string Name { get; private set; }

        public ProductStatus ProductStatus { get; private set; }
        private int _productStatusId;

        protected Product() { }

        public Product(string code, Guid identity, string name) : this()
        {
            Code = !string.IsNullOrWhiteSpace(code) ? code : throw new ArgumentNullException(nameof(code));
            Identity = identity != Guid.Empty ? identity : throw new ArgumentNullException(nameof(identity));
            Name = !string.IsNullOrWhiteSpace(name) ? name : throw new ArgumentNullException(nameof(name));

            _productStatusId = ProductStatus.Avaiable.Id;
        }

        public void SetOnStockStatus()
        {
            if (_productStatusId == ProductStatus.Locked.Id)
            {
                AddDomainEvent(new ItemStatusChangedToOnStockDomainEvent(Id));

                _productStatusId = ProductStatus.Avaiable.Id;
            }
        }

        public void SetRemovedStatus()
        {
            if (_productStatusId == ProductStatus.Avaiable.Id)
            {
                AddDomainEvent(new ItemStatusChangedToRemovedDomainEvent(Id));

                _productStatusId = ProductStatus.Locked.Id;
            }
        }

        public void SetLockedStatus()
        {
            if (_productStatusId == ProductStatus.Avaiable.Id)
            {
                AddDomainEvent(new ItemStatusChangedToLockedDomainEvent(Id));

                _productStatusId = ProductStatus.Locked.Id;
            }
        }
    }
}
