using BuildingBlocks.FunctionalTests.Attributes;
using BuildingBlocks.FunctionalTests.Extensions;
using Catalog.API.Application.Commands.CreateProduct;
using Catalog.API.Application.Queries;
using Catalog.FunctionalTests.Utils;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;

namespace Catalog.FunctionalTests
{
    [TestCaseOrderer("BuildingBlocks.FunctionalTests.Attributes.PriorityOrderer", "BuildingBlocks.FunctionalTests")]
    public class ProductTests : CatalogScenarioBase
    {
        public ProductTests(AppFixture appFixture) : base(appFixture)
        {
        }

        [Fact]
        public async Task Get_product_should_return_ok_status_code()
        {
            var response = await HttpClient.GetAsync(Get.Product.All);
            response.EnsureSuccessStatusCode();
        }

        [Fact, TestPriority(1)]
        public async Task Create_product_should_return_created_status_code()
        {
            var command = new CreateProductCommand(Guid.NewGuid().ToString(), "Fake Product", "Fake Description", 100000, 1);
            var response = await HttpClient.PostAsync(Post.Product.Create, command.ToStringContent());
            response.EnsureSuccessStatusCode();

            var product = response.Deserialize<Product>();
            Fixture.Data.Add("product-id", product.id);
        }

        [Fact, TestPriority(2)]
        public async Task Get_product_by_id_should_return_target_product_with_ok_status_code()
        {
            var response = await HttpClient.GetAsync(Get.Product.ById((int)Fixture.Data["product-id"]));
            response.EnsureSuccessStatusCode();
        }

        [Fact]
        public async Task Get_product_status_should_return_ok_status_code()
        {
            var response = await HttpClient.GetAsync(Get.Product.All);
            response.EnsureSuccessStatusCode();

            var productStatus = response.Deserialize<IEnumerable<ProductStatus>>();
            Assert.NotEmpty(productStatus);
        }
    }
}
