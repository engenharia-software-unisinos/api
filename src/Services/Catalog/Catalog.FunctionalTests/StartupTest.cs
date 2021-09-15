using BuildingBlocks.FunctionalTests;
using Catalog.API;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace Catalog.FunctionalTests
{
    public class StartupTests : Startup
    {
        public StartupTests(IConfiguration configuration) : base(configuration) { }


        // This method gets called by the runtime. Use this method to add services to the container.
        public override IServiceProvider ConfigureServices(IServiceCollection services)
        {
            services.Configure<RouteOptions>(Configuration);
            return base.ConfigureServices(services);
        }

        protected override void ConfigureAuth(IApplicationBuilder app)
        {
            app.UseMiddleware<AutoAuthorizeMiddleware>();

        }
    }
}
