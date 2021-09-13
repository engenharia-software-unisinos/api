using Autofac;
using BuildingBlocks.EventBus.Abstractions;
using Catalog.API.Application.Commands.CreateProduct;
using Catalog.Domain.AggregatesModel.ProductAggregate;
using Catalog.Infrastructure.Repositories;
using System.Reflection;

namespace Catalog.API.Infrastructure.AutofacModules
{
    public class ApplicationModule
           : Autofac.Module
    {

        public string QueriesConnectionString { get; }

        public ApplicationModule(string qconstr)
        {
            QueriesConnectionString = qconstr;

        }

        protected override void Load(ContainerBuilder builder)
        {

            //builder.Register(c => new OrderingQueries(QueriesConnectionString))
            //    .As<IOrderingQueries>()
            //    .InstancePerLifetimeScope();

            builder.RegisterType<ProductRepository>()
                .As<IProductRepository>()
                .InstancePerLifetimeScope();

            builder.RegisterAssemblyTypes(typeof(CreateProductCommandHandler).GetTypeInfo().Assembly)
                .AsClosedTypesOf(typeof(IIntegrationEventHandler<>));
        }
    }
}
