using Catalog.API.Application.Commands.DeleteProduct;
using Catalog.API.Application.Validations;
using Microsoft.Extensions.Logging;
using Moq;
using Xunit;

namespace Catalog.UnitTests.Application
{
    public class DeleteProductCommandValidatorTests
    {
        private readonly Mock<ILogger<DeleteProductCommandValidator>> _loggerMock;

        public DeleteProductCommandValidatorTests()
        {
            _loggerMock = new Mock<ILogger<DeleteProductCommandValidator>>();
        }

        [Fact]
        public void Valid_command_should_pass_validation()
        {
            //Arrange
            var productId = 123;

            var validator = new DeleteProductCommandValidator(_loggerMock.Object);
            var command = new DeleteProductCommand(productId);

            //Act
            var validationResult = validator.Validate(command);

            //Assert
            Assert.True(validationResult.IsValid);
        }

        [Theory]
        [InlineData(0)]
        [InlineData(-1)]
        public void Invalid_productId_should_fail_validation(int productId)
        {
            //Arrange
            var validator = new DeleteProductCommandValidator(_loggerMock.Object);
            var command = new DeleteProductCommand(productId);

            //Act
            var validationResult = validator.Validate(command);

            //Assert
            Assert.False(validationResult.IsValid);
        }
    }
}
