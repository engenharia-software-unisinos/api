using Autofac;
using BuildingBlocks.EventBus.Abstractions;
using Inventory.API.Application.Commands;
using Inventory.API.Application.Queries;
using Inventory.Domain.AggregatesModel.ItemAggregate;
using Inventory.Infrastructure.Idempotency;
using Inventory.Infrastructure.Repositories;
using System.Reflection;

namespace Inventory.API.Infrastructure.AutofacModules
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

            builder.Register(c => new InventoryQueries(QueriesConnectionString))
                .As<IInventoryQueries>()
                .InstancePerLifetimeScope();

            builder.RegisterType<ItemRepository>()
                .As<IProductRepository>()
                .InstancePerLifetimeScope();

            builder.RegisterType<RequestManager>()
               .As<IRequestManager>()
               .InstancePerLifetimeScope();

            builder.RegisterAssemblyTypes(typeof(CreateItemCommandHandler).GetTypeInfo().Assembly)
                .AsClosedTypesOf(typeof(IIntegrationEventHandler<>));
        }
    }
}
