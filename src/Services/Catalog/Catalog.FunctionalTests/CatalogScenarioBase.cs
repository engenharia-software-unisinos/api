using BuildingBlocks.FunctionalTests;
using Catalog.FunctionalTests.Utils;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.Configuration;
using System.IO;
using System.Net.Http;
using System.Reflection;
using Xunit;

namespace Catalog.FunctionalTests
{
    [Collection("Functional")]
    public abstract class CatalogScenarioBase
    {
        private TestServer _testServer { get; }
        private AccessTokenProvider _accessTokenProvider { get; }
        
        protected AppFixture Fixture { get; }

        public CatalogScenarioBase(AppFixture appFixture)
        {
            Fixture = appFixture;

            _testServer = CatalogServiceFactory.BuildServer();
            
            var config = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", false, false)
                .Build();

            var testSettings = config.GetSection("TestSettings").Get<TestSettings>();
            _accessTokenProvider = new AccessTokenProvider(testSettings);
        }

        public HttpClient HttpClient
        {
            get
            {
                return _testServer.CreateClient();
            }
        }

        public void ClearAuthorizedHttpClient()
        {
            _accessTokenProvider.Clear();
        }

        public static class Get
        {
            public static class Product
            {
                public static string All = "api/v1/product";
                public static string ProductStatus = "api/v1/product/product-status";

                public static string ById(int id)
                {
                    return $"api/v1/product?productId={id}";
                }
            }
        }

        public static class Post
        {
            public static class Product
            {
                public static string Create = "api/v1/product";
            }
        }
    }
}
