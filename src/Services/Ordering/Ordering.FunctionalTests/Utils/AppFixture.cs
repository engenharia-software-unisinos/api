using BuildingBlocks.FunctionalTests;
using Ordering.API;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Ordering.FunctionalTests.Utils
{
    public class AppFixture : IDisposable
    {
        private readonly OrderingServiceFactory<Startup> _webAppFactory;

        public HttpClient Client { get; }
        public TestSettings TestSettings { get; private set; }
        public Dictionary<string, object> Data { get; set; }

        public AppFixture()
        {
            var path = Assembly.GetAssembly(typeof(OrderingScenarios))
                .Location;

            _webAppFactory = new OrderingServiceFactory<Startup>(builder =>
            {
                builder.UseContentRoot(Path.GetDirectoryName(path));
                builder.ConfigureAppConfiguration(GetAppConfiguration());
            });

            Client = _webAppFactory.CreateDefaultClient();

            Data = new Dictionary<string, object>();
        }

        private Action<IConfigurationBuilder> GetAppConfiguration()
        {
            return configBuilder =>
            {
                configBuilder.AddJsonFile("appsettings.json", optional: false)
                    .AddEnvironmentVariables();


                var config = configBuilder.Build();

                TestSettings = config.GetSection("TestSettings").Get<TestSettings>();
            };
        }

        private bool _disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposedValue)
            {
                if (disposing)
                {
                    _webAppFactory.Dispose();
                }

                _disposedValue = true;
            }
        }

        public void Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
        }
    }
}
