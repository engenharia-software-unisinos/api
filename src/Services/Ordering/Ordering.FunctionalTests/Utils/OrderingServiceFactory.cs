using Ordering.API;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.Hosting;
using System;

namespace Ordering.FunctionalTests.Utils
{
    public class OrderingServiceFactory<TStartup> : WebApplicationFactory<TStartup> where TStartup : class
    {
        private Action<IHostBuilder> _configuration;
        public OrderingServiceFactory(Action<IHostBuilder> configuration)
        {
            _configuration = configuration;
        }

        protected override void ConfigureWebHost(IWebHostBuilder builder)
        {
            builder.UseEnvironment("Testing");
            builder.UseStartup<StartupTests>();
        }

        protected override IHostBuilder CreateHostBuilder()
        {
            var builder = Host.CreateDefaultBuilder();

            _configuration?.Invoke(builder);

            return builder;
        }
    }
}
