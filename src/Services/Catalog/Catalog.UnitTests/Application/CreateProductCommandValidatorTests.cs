using Catalog.API.Application.Commands.CreateProduct;
using Catalog.API.Application.Validations;
using Microsoft.Extensions.Logging;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace Catalog.UnitTests.Application
{
    public class CreateProductCommandValidatorTests
    {
        private readonly Mock<ILogger<CreateProductCommandValidator>> _loggerMock;

        public CreateProductCommandValidatorTests()
        {
            _loggerMock = new Mock<ILogger<CreateProductCommandValidator>>();
        }

        [Fact]
        public void Valid_product_should_pass_validation()
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var name = "Fake Product";
            var description = "Fake description";
            var price = 100m;
            var amount = 1;

            var validator = new CreateProductCommandValidator(_loggerMock.Object);
            var command = new CreateProductCommand(code, name, description, price, amount);

            //Act
            var validationResult = validator.Validate(command);

            //Assert
            Assert.True(validationResult.IsValid);
        }

        [Theory]
        [InlineData("")]
        [InlineData(null)]
        public void Invalid_code_should_fail_validation(string code)
        {
            //Arrange
            var name = "Fake Product";
            var description = "Fake description";
            var price = 100m;
            var amount = 1;

            var validator = new CreateProductCommandValidator(_loggerMock.Object);
            var command = new CreateProductCommand(code, name, description, price, amount);

            //Act
            var validationResult = validator.Validate(command);

            //Assert
            Assert.False(validationResult.IsValid);
        }

        [Theory]
        [InlineData("")]
        [InlineData(null)]
        public void Invalid_name_should_fail_validation(string name)
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var description = "Fake description";
            var price = 100m;
            var amount = 1;

            var validator = new CreateProductCommandValidator(_loggerMock.Object);
            var command = new CreateProductCommand(code, name, description, price, amount);

            //Act
            var validationResult = validator.Validate(command);

            //Assert
            Assert.False(validationResult.IsValid);
        }

        [Theory]
        [InlineData(0)]
        [InlineData(-1)]
        public void Invalid_price_should_fail_validation(decimal price)
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var name = "Fake Product";
            var description = "Fake description";
            var amount = 1;

            var validator = new CreateProductCommandValidator(_loggerMock.Object);
            var command = new CreateProductCommand(code, name, description, price, amount);

            //Act
            var validationResult = validator.Validate(command);

            //Assert
            Assert.False(validationResult.IsValid);
        }

        [Theory]
        [InlineData(0)]
        [InlineData(-1)]
        public void Invalid_amount_should_fail_validation(int amount)
        {
            //Arrange
            var code = Guid.NewGuid().ToString();
            var name = "Fake Product";
            var description = "Fake description";
            var price = 100m;

            var validator = new CreateProductCommandValidator(_loggerMock.Object);
            var command = new CreateProductCommand(code, name, description, price, amount);

            //Act
            var validationResult = validator.Validate(command);

            //Assert
            Assert.False(validationResult.IsValid);
        }
    }
}
