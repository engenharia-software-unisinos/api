using Ordering.Domain.Exceptions;
using Ordering.Domain.SeedWork;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Ordering.Domain.AggregatesModel.OrderAggregate
{
    public class OrderStatus : Enumeration
    {
        public static OrderStatus Pending = new OrderStatus(1, nameof(Pending).ToLowerInvariant());
        public static OrderStatus Purchased = new OrderStatus(2, nameof(Purchased).ToLowerInvariant());
        public static OrderStatus Canceled = new OrderStatus(3, nameof(Canceled).ToLowerInvariant());

        public OrderStatus(int id, string name) : base(id, name) { }

        public static IEnumerable<OrderStatus> List() =>
            new[] { Pending, Purchased, Canceled };

        public static OrderStatus FromName(string name)
        {
            var state = List().SingleOrDefault(s => string.Equals(s.Name, name, StringComparison.CurrentCultureIgnoreCase));

            if (state == null)
            {
                throw new OrderingDomainException($"Possible values for {nameof(OrderStatus)}: {String.Join(",", List().Select(s => s.Name))}");
            }

            return state;
        }

        public static OrderStatus From(int id)
        {
            var state = List().SingleOrDefault(s => s.Id == id);

            if (state == null)
            {
                throw new OrderingDomainException($"Possible values for {nameof(OrderStatus)}: {String.Join(",", List().Select(s => s.Name))}");
            }

            return state;
        }
    }
}
