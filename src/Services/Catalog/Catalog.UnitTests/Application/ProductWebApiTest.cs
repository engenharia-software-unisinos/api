
using BuildingBlocks.Identity;
using BuldingBlocks.SeedWork;
using Catalog.API.Application.Queries;
using Catalog.API.Controllers;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Moq;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;

namespace Catalog.UnitTests.Application
{
    public class ProductWebApiTest
    {
        private readonly Mock<IMediator> _mediatorMock;
        private readonly Mock<IProductQueries> _productQueriesMock;
        private readonly Mock<IIdentityService> _identityServiceMock;
        private readonly Mock<ILogger<ProductController>> _loggerMock;

        public ProductWebApiTest()
        {
            _mediatorMock = new Mock<IMediator>();
            _productQueriesMock = new Mock<IProductQueries>();
            _identityServiceMock = new Mock<IIdentityService>();
            _loggerMock = new Mock<ILogger<ProductController>>();
        }

        [Fact]
        public async Task Get_products_success()
        {
            //Arrange
            var products = Enumerable.Empty<Product>();

            _productQueriesMock
                .Setup(x => x.GetProductsAsync())
                .ReturnsAsync(products);

            //Act
            var productController = new ProductController(_mediatorMock.Object, _productQueriesMock.Object, _identityServiceMock.Object, _loggerMock.Object);
            var actionResult = await productController.GetProducts();

            Assert.Equal((int)System.Net.HttpStatusCode.OK, (actionResult.Result as OkObjectResult).StatusCode);
        }

        [Fact]
        public async Task Get_product_success()
        {
            //Arrange
            var productId = 123;
            var product = new Product();

            _productQueriesMock
                .Setup(x => x.GetProductAsync(It.IsAny<int>()))
                .ReturnsAsync(product);

            //Act
            var productController = new ProductController(_mediatorMock.Object, _productQueriesMock.Object, _identityServiceMock.Object, _loggerMock.Object);
            var actionResult = await productController.GetProduct(productId);

            Assert.Equal((int)System.Net.HttpStatusCode.OK, (actionResult.Result as OkObjectResult).StatusCode);
        }

        [Fact]
        public async Task Get_product_not_found()
        {
            //Arrange
            var productId = 123;
            var notFoundException = new KeyNotFoundException();

            _productQueriesMock
                .Setup(x => x.GetProductAsync(It.IsAny<int>()))
                .ThrowsAsync(notFoundException);

            //Act
            var productController = new ProductController(_mediatorMock.Object, _productQueriesMock.Object, _identityServiceMock.Object, _loggerMock.Object);
            var actionResult = await productController.GetProduct(productId);
            
            Assert.Equal((int)System.Net.HttpStatusCode.NotFound, (actionResult.Result as NotFoundResult).StatusCode);
        }

        [Fact]
        public async Task Create_product_status_success()
        {
            //Arrange
            var productStatus = Enumerable.Empty<ProductStatus>();
            _productQueriesMock.Setup(x => x.GetProductStatusAsync())
                .ReturnsAsync(productStatus);

            //Act
            var productController = new ProductController(_mediatorMock.Object, _productQueriesMock.Object, _identityServiceMock.Object, _loggerMock.Object);
            var actionResult = await productController.GetProductStatusAsync();

            Assert.Equal((int)System.Net.HttpStatusCode.OK, (actionResult.Result as OkObjectResult).StatusCode);
        }
    }
}
