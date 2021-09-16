using BuildingBlocks.Identity;
using Catalog.API.Application.Commands.CreateProduct;
using Catalog.Domain.AggregatesModel.ProductAggregate;
using MediatR;
using Microsoft.Extensions.Logging;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace Catalog.UnitTests.Application
{
    public class CreateProductCommandHandlerTests
    {
        private readonly Mock<IProductRepository> _productRepositoryMock;
        private readonly Mock<IIdentityService> _identityServiceMock;
        private readonly Mock<ILogger<CreateProductCommandHandler>> _loggerMock;

        public CreateProductCommandHandlerTests()
        {
            _productRepositoryMock = new Mock<IProductRepository>();
            _identityServiceMock = new Mock<IIdentityService>();
            _loggerMock = new Mock<ILogger<CreateProductCommandHandler>>();
        }


        [Fact]
        public async Task Create_product_should_return_product_dto()
        {
            //Arrange
            _identityServiceMock
                .Setup(x => x.GetUserIdentity())
                .Returns(Guid.NewGuid());
            _productRepositoryMock
                .Setup(x => x.Add(It.IsAny<Product>()))
                .Returns(FakeProduct);
            _productRepositoryMock
                .Setup(x => x.UnitOfWork.SaveEntitiesAsync(default(CancellationToken)))
                .ReturnsAsync(true);

            var cancellationToken = new CancellationToken();
            var handler = new CreateProductCommandHandler(_productRepositoryMock.Object, _identityServiceMock.Object, _loggerMock.Object);
            var command = FakeCreateProductRequest();

            //Act
            var result = await handler.Handle(command, cancellationToken);

            //Assert
            Assert.NotNull(result);
        }

        [Fact]
        public async Task Create_product_with_database_save_fail_should_return_null()
        {
            //Arrange
            _identityServiceMock
                .Setup(x => x.GetUserIdentity())
                .Returns(Guid.NewGuid());
            _productRepositoryMock
                .Setup(x => x.Add(It.IsAny<Product>()))
                .Returns(FakeProduct);
            _productRepositoryMock
                .Setup(x => x.UnitOfWork.SaveEntitiesAsync(default(CancellationToken)))
                .ReturnsAsync(false);

            var cancellationToken = new CancellationToken();
            var handler = new CreateProductCommandHandler(_productRepositoryMock.Object, _identityServiceMock.Object, _loggerMock.Object);
            var command = FakeCreateProductRequest();

            //Act
            var result = await handler.Handle(command, cancellationToken);

            //Assert
            Assert.Null(result);
        }

        private Product FakeProduct()
        {
            return new Product(Guid.NewGuid().ToString(), Guid.NewGuid(), "Fake Product Name", null, 10000m, 1);
        }

        private CreateProductCommand FakeCreateProductRequest(Dictionary<string, object> args = null)
        {
            return new CreateProductCommand(
                code: args != null && args.ContainsKey("code") ? (string)args["code"] : Guid.NewGuid().ToString(),
                name: args != null && args.ContainsKey("name") ? (string)args["name"] : "Fake Product Name",
                description: args != null && args.ContainsKey("description") ? (string)args["description"] : null,
                price: args != null && args.ContainsKey("price") ? (decimal)args["price"] : 10000m,
                amount: args != null && args.ContainsKey("amount") ? (int)args["amount"] : 1
            );
        }
    }
}
