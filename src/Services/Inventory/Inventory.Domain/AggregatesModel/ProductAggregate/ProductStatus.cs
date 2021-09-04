using Inventory.Domain.Exceptions;
using Inventory.Domain.SeedWork;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Inventory.Domain.AggregatesModel.ItemAggregate
{
    public class ProductStatus : Enumeration
    {
        public static ProductStatus Avaiable = new ProductStatus(1, nameof(Avaiable).ToLowerInvariant());
        public static ProductStatus Locked = new ProductStatus(2, nameof(Locked).ToLowerInvariant());

        public ProductStatus(int id, string name) : base(id, name) { }

        public static IEnumerable<ProductStatus> List() =>
            new[] { Avaiable, Locked, Locked };

        public static ProductStatus FromName(string name)
        {
            var state = List().SingleOrDefault(s => string.Equals(s.Name, name, StringComparison.CurrentCultureIgnoreCase));

            if (state == null)
            {
                throw new InventoryDomainException($"Possible values for {nameof(ProductStatus)}: {String.Join(",", List().Select(s => s.Name))}");
            }

            return state;
        }

        public static ProductStatus From(int id)
        {
            var state = List().SingleOrDefault(s => s.Id == id);

            if (state == null)
            {
                throw new InventoryDomainException($"Possible values for {nameof(ProductStatus)}: {String.Join(",", List().Select(s => s.Name))}");
            }

            return state;
        }
    }


}
