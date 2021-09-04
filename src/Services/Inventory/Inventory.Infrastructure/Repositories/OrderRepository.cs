using Inventory.Domain.AggregatesModel.OrderAggregate;
using Inventory.Domain.SeedWork;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace Inventory.Infrastructure.Repositories
{
    public class OrderRepository : IOrderRepository
    {
        private readonly InventoryContext _context;
        public IUnitOfWork UnitOfWork
        {
            get
            {
                return _context;
            }
        }

        public OrderRepository(InventoryContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public Order Add(Order order)
        {
            return _context.Orders.Add(order).Entity;
        }

        public async Task<Order> GetAsync(int orderId)
        {
            var order = await _context.Orders.FirstOrDefaultAsync(x => x.Id == orderId);

            if (order != null)
            {
                await _context.Entry(order).Collection(x => x.OrderItems).LoadAsync();
                await _context.Entry(order).Reference(x => x.OrderStatus).LoadAsync();
            }

            return order;
        }

        public void Update(Order order)
        {
            _context.Entry(order).State = EntityState.Modified;
        }
    }
}
