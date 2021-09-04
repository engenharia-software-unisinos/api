﻿using MediatR;

namespace Inventory.Domain.Events
{
    public class ItemStatusChangedToLockedDomainEvent : INotification
    {
        public ItemStatusChangedToLockedDomainEvent(int id)
        {
            ItemId = id;
        }

        public int ItemId { get; }
    }
}
