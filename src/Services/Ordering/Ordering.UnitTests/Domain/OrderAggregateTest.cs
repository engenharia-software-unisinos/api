using Ordering.Domain.AggregatesModel.OrderAggregate;
using System;
using System.Linq;
using Xunit;

namespace Ordering.UnitTests.Domain
{
    public class OrderAggregateTest
    {
        public OrderAggregateTest() { }

        [Fact]
        public void Create_order_success()
        {
            //Arrange
            var buyerId = Guid.NewGuid();
            var description = "fake-description";
            
            //Act
            var order = new Order(buyerId, description);

            //Assert
            Assert.NotNull(order);
        }

        [Fact]
        public void Create_order_draft_success()
        {
            //Arrange - Act
            var order = Order.NewDraft();

            //Assert
            Assert.True(order.IsTransient());
        }

        [Fact]
        public void Invalid_order_buyerid()
        {
            //Arrange
            var buyerId = Guid.Empty;
            var description = "fake-description";

            //Act - Assert
            Assert.Throws<ArgumentNullException>(() => new Order(buyerId, description));
        }

        [Fact]
        public void Add_orderitem_to_order_success()
        {
            //Arrange
            var buyerId = Guid.NewGuid();
            var observation = "FakeProductDescription";

            var productId = 1;
            var productName = "FakeProductName";
            var productPrice = 20;
            var amount = 1;

            //Act
            var order = new Order(buyerId, observation);

            order.AddOrderItem(productId, productName, productPrice, amount);

            //Assert
            Assert.Equal(1, order.OrderItems.Count);
        }

        [Fact]
        public void Add_orderitem_twice_to_order_success()
        {
            //Arrange
            var buyerId = Guid.NewGuid();
            var observation = "FakeProductDescription";

            var productId = 1;
            var productName = "FakeProductName";
            var productPrice = 20;
            var amount = 1;

            //Act
            var order = new Order(buyerId, observation);

            order.AddOrderItem(productId, productName, productPrice, amount);
            order.AddOrderItem(productId, productName, productPrice, amount);

            //Assert
            var orderItem = order.OrderItems.ToList().First();

            Assert.Equal(1, order.OrderItems.Count);
            Assert.Equal(2, orderItem.GetAmount());
        }

        [Fact]
        public void Remove_orderitem_from_order_success()
        {
            //Arrange
            var buyerId = Guid.NewGuid();
            var observation = "FakeProductDescription";
            var productId = 1;
            var productName = "FakeProductName";
            var productPrice = 20;
            var amount = 1;

            //Act
            var order = new Order(buyerId, observation);

            order.AddOrderItem(productId, productName, productPrice, amount);

            order.AddOrderItem(productId, productName, productPrice, -1);

            //Assert
            Assert.Equal(0, order.OrderItems.Count);
        }

        [Fact]
        public void Invalid_add_orderitem_amount_to_order()
        {
            //Arrange
            var buyerId = Guid.NewGuid();
            var observation = "FakeProductDescription";

            var productId = 1;
            var productName = "FakeProductName";
            var productPrice = 20;

            //Act - Assert
            var order = new Order(buyerId, observation);

            Assert.Throws<ArgumentException>(() => order.AddOrderItem(productId, productName, productPrice, 0));
        }

        [Fact]
        public void Invalid_removed_orderitem_amount_to_order()
        {
            //Arrange
            var buyerId = Guid.NewGuid();
            var observation = "FakeProductDescription";

            var productId = 1;
            var productName = "FakeProductName";
            var productPrice = 20;

            //Act - Assert
            var order = new Order(buyerId, observation);

            Assert.Throws<ArgumentException>(() => order.AddOrderItem(productId, productName, productPrice, -200));
        }

        [Fact]
        public void Create_order_item_success()
        {
            //Arrange
            var productId = 1;
            var productName = "FakeProductName";
            var productPrice = 20;
            var amount = 1;
            var description = "FakeProductDescription";

            //Act
            var orderItem = new OrderItem(productId, productName, productPrice, amount);

            //Assert
            Assert.NotNull(orderItem);
        }

        [Fact]
        public void Invalid_orderitem_product_id()
        {
            //Arrange
            var productId = 0;
            var productName = "FakeProductName";
            var productPrice = 20;
            var amount = 1;
            var description = "FakeProductDescription";

            //Act - Assert
            Assert.Throws<ArgumentException>(() => new OrderItem(productId, productName, productPrice, amount));
        }

        [Fact]
        public void Invalid_orderitem_product_name()
        {
            //Arrange
            var productId = 1;
            var productName = "";
            var productPrice = 20;
            var amount = 1;
            var description = "FakeProductDescription";

            //Act - Assert
            Assert.Throws<ArgumentNullException>(() => new OrderItem(productId, productName, productPrice, amount));
        }

        [Fact]
        public void Invalid_orderitem_product_price()
        {
            //Arrange
            var productId = 1;
            var productName = "FakeProductName";
            var productPrice = 0;
            var amount = 1;
            var description = "FakeProductDescription";

            //Act - Assert
            Assert.Throws<ArgumentException>(() => new OrderItem(productId, productName, productPrice, amount));
        }

        [Fact]
        public void Invalid_orderitem_product_amount()
        {
            //Arrange
            var productId = 1;
            var productName = "FakeProductName";
            var productPrice = 20;
            var amount = 0;
            var description = "FakeProductDescription";

            //Act - Assert
            Assert.Throws<ArgumentException>(() => new OrderItem(productId, productName, productPrice, amount));
        }


    }
}
