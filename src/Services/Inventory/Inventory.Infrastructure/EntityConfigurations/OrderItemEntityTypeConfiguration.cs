using Inventory.Domain.AggregatesModel.OrderAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Inventory.Infrastructure.EntityConfigurations
{
    public class OrderItemEntityTypeConfiguration : IEntityTypeConfiguration<OrderItem>
    {
        public void Configure(EntityTypeBuilder<OrderItem> builder)
        {
            builder.ToTable("orderitems", InventoryContext.DEFAULT_SCHEMA);

            builder.HasKey(o => o.Id);
            builder.Ignore(b => b.DomainEvents);

            builder.Property(x => x.Id)
                .UseHiLo("orderitemseq");

            builder.Property<int>("OrderId").IsRequired();

            builder
                 .Property<string>("_productName")
                 .UsePropertyAccessMode(PropertyAccessMode.Field)
                 .HasColumnName("ProductName")
                 .IsRequired();

            builder
                 .Property<decimal>("_productPrice")
                 .UsePropertyAccessMode(PropertyAccessMode.Field)
                 .HasColumnName("ProductPrice")
                 .IsRequired();

            builder
                 .Property<int>("_amount")
                 .UsePropertyAccessMode(PropertyAccessMode.Field)
                 .HasColumnName("Amount")
                 .IsRequired();
        }
    }
}
