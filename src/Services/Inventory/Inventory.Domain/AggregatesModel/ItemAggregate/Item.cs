using Inventory.Domain.Events;
using Inventory.Domain.SeedWork;
using System;

namespace Inventory.Domain.AggregatesModel.ItemAggregate
{
    public class Item : Entity, IAggregateRoot
    {
        public string Code { get; private set; }
        public string Identity { get; private set; }
        public string Name { get; private set; }

        public ItemStatus ItemStatus { get; private set; }
        private int _itemStatusId;

        protected Item() { }

        public Item(string code, string identity, string name) : this()
        {
            Code = !string.IsNullOrWhiteSpace(code) ? code : throw new ArgumentNullException(nameof(code));
            Identity = !string.IsNullOrWhiteSpace(identity) ? identity : throw new ArgumentNullException(nameof(identity));
            Name = !string.IsNullOrWhiteSpace(name) ? name : throw new ArgumentNullException(nameof(name));

            _itemStatusId = ItemStatus.OnStock.Id;
        }

        public void SetOnStockStatus()
        {
            if (_itemStatusId == ItemStatus.Locked.Id)
            {
                AddDomainEvent(new ItemStatusChangedToOnStockDomainEvent(Id));

                _itemStatusId = ItemStatus.OnStock.Id;
            }
        }

        public void SetRemovedStatus()
        {
            if (_itemStatusId == ItemStatus.OnStock.Id)
            {
                AddDomainEvent(new ItemStatusChangedToRemovedDomainEvent(Id));

                _itemStatusId = ItemStatus.Removed.Id;                
            }
        }

        public void SetLockedStatus()
        {
            if (_itemStatusId == ItemStatus.OnStock.Id)
            {
                AddDomainEvent(new ItemStatusChangedToLockedDomainEvent(Id));

                _itemStatusId = ItemStatus.Locked.Id;
            }
        }
    }
}
