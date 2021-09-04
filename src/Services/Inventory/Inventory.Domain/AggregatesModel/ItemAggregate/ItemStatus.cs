using Inventory.Domain.Exceptions;
using Inventory.Domain.SeedWork;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Inventory.Domain.AggregatesModel.ItemAggregate
{
    public class ItemStatus : Enumeration
    {
        public static ItemStatus OnStock = new ItemStatus(1, nameof(OnStock).ToLowerInvariant());
        public static ItemStatus Removed = new ItemStatus(2, nameof(Removed).ToLowerInvariant());
        public static ItemStatus Locked = new ItemStatus(3, nameof(Locked).ToLowerInvariant());

        public ItemStatus(int id, string name) : base(id, name) { }

        public static IEnumerable<ItemStatus> List() =>
            new[] { OnStock, Removed, Locked };

        public static ItemStatus FromName(string name)
        {
            var state = List().SingleOrDefault(s => string.Equals(s.Name, name, StringComparison.CurrentCultureIgnoreCase));

            if (state == null)
            {
                throw new InventoryDomainException($"Possible values for {nameof(ItemStatus)}: {String.Join(",", List().Select(s => s.Name))}");
            }

            return state;
        }

        public static ItemStatus From(int id)
        {
            var state = List().SingleOrDefault(s => s.Id == id);

            if (state == null)
            {
                throw new InventoryDomainException($"Possible values for {nameof(ItemStatus)}: {String.Join(",", List().Select(s => s.Name))}");
            }

            return state;
        }
    }


}
