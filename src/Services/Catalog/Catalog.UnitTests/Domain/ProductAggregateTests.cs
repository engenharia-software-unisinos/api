using Catalog.Domain.AggregatesModel.ProductAggregate;
using Catalog.Domain.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace Catalog.UnitTests.Domain
{
    public class ProductAggregateTests
    {
        public ProductAggregateTests() { }

        [Fact]
        public void Create_product_success()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var owner = Guid.NewGuid();
            var name = "Fake Product Name";
            var description = "Fake Description";
            var price = 10.00m;
            var amount = 1;

            //Act
            var product = new Product(code, owner, name, description, price, amount);

            //Assert
            Assert.NotNull(product);
        }

        [Fact]
        public void Change_product_status_to_locked()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var owner = Guid.NewGuid();
            var name = "Fake Product Name";
            var description = "Fake Description";
            var price = 10.00m;
            var amount = 1;

            //Act
            var product = new Product(code, owner, name, description, price, amount);

            product.SetLockedStatus();

            //Assert
            Assert.NotNull(product.DomainEvents.FirstOrDefault(x => x is ProductStatusChangedToLockedDomainEvent));
        }

        [Fact]
        public void Change_product_status_to_avaiable()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var owner = Guid.NewGuid();
            var name = "Fake Product Name";
            var description = "Fake Description";
            var price = 10.00m;
            var amount = 1;

            //Act
            var product = new Product(code, owner, name, description, price, amount);

            product.SetLockedStatus();
            product.SetAvaiableStatus();

            //Assert
            Assert.NotNull(product.DomainEvents.FirstOrDefault(x => x is ProductStatusChangedToAvaiableDomainEvent));
        }

        [Fact]
        public void Invalid_change_product_status_to_avaiable_when_status_is_avaiable_should_not_add_domain_event()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var owner = Guid.NewGuid();
            var name = "Fake Product Name";
            var description = "Fake Description";
            var price = 10.00m;
            var amount = 1;

            //Act
            var product = new Product(code, owner, name, description, price, amount);

            product.SetAvaiableStatus();

            //Assert
            Assert.Null(product.DomainEvents.FirstOrDefault(x => x is ProductStatusChangedToAvaiableDomainEvent));
        }

        [Fact]
        public void Invalid_change_product_status_to_avaiable_when_status_is_locked_should_not_add_domain_event()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var owner = Guid.NewGuid();
            var name = "Fake Product Name";
            var description = "Fake Description";
            var price = 10.00m;
            var amount = 1;

            //Act
            var product = new Product(code, owner, name, description, price, amount);

            // Because the product state is avaiable, we have to first change once to locked for testing purpuses
            // But the second time set locked is executed, it should not add a second domain event, leaving only one
            product.SetLockedStatus();
            product.SetLockedStatus();

            //Assert
            Assert.Single(product.DomainEvents.Where(x => x is ProductStatusChangedToLockedDomainEvent));
        }

        [Fact]
        public void Invalid_product_code()
        {
            //Arrange
            var code = string.Empty;
            var owner = Guid.NewGuid();
            var name = "Fake Product Name";
            var description = "Fake Description";
            var price = 10.00m;
            var amount = 1;

            //Act - Assert
            Assert.Throws<ArgumentNullException>(() => new Product(code, owner, name, description, price, amount));
        }

        [Fact]
        public void Invalid_product_owner()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var owner = Guid.Empty;
            var name = "Fake Product Name";
            var description = "Fake Description";
            var price = 10.00m;
            var amount = 1;

            //Act - Assert
            Assert.Throws<ArgumentNullException>(() => new Product(code, owner, name, description, price, amount));
        }

        [Fact]
        public void Invalid_product_name()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var owner = Guid.NewGuid();
            var name = string.Empty;
            var description = "Fake Description";
            var price = 10.00m;
            var amount = 1;

            //Act - Assert
            Assert.Throws<ArgumentNullException>(() => new Product(code, owner, name, description, price, amount));
        }

        [Fact]
        public void Invalid_product_description()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var owner = Guid.NewGuid();
            var name = "Fake Product Name";
            var description = string.Empty;
            var price = 10.00m;
            var amount = 1;

            //Act - Assert
            Assert.Throws<ArgumentNullException>(() => new Product(code, owner, name, description, price, amount));
        }

        [Fact]
        public void Invalid_product_price()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var owner = Guid.NewGuid();
            var name = "Fake Product Name";
            var description = "Fake Description";
            var price = 0m;
            var amount = 1;

            //Act - Assert
            Assert.Throws<ArgumentException>(() => new Product(code, owner, name, description, price, amount));
        }

        [Fact]
        public void Invalid_product_amount()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var owner = Guid.NewGuid();
            var name = "Fake Product Name";
            var description = "Fake Description";
            var price = 10.00m;
            var amount = 0;

            //Act - Assert
            Assert.Throws<ArgumentException>(() => new Product(code, owner, name, description, price, amount));
        }
    }
}
