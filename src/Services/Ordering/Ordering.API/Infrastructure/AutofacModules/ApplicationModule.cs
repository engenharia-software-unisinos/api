using Autofac;
using BuildingBlocks.EventBus.Abstractions;
using Ordering.API.Application.Commands;
using Ordering.API.Application.Queries;
using Ordering.Domain.AggregatesModel.ItemAggregate;
using Ordering.Infrastructure.Idempotency;
using Ordering.Infrastructure.Repositories;
using System.Reflection;

namespace Ordering.API.Infrastructure.AutofacModules
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

            builder.Register(c => new OrderingQueries(QueriesConnectionString))
                .As<IOrderingQueries>()
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
