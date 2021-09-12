using Inventory.API;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.Hosting;
using System;

namespace Inventory.FunctionalTests.Utils
{
    public class InventoryServiceFactory<TStartup> : WebApplicationFactory<TStartup> where TStartup : class
    {
        private Action<IHostBuilder> _configuration;
        public InventoryServiceFactory(Action<IHostBuilder> configuration)
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
