using Inventory.Domain.AggregatesModel.ItemAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Inventory.Infrastructure.EntityConfigurations
{
    public class ItemEntityTypeConfiguration : IEntityTypeConfiguration<Item>
    {
        public void Configure(EntityTypeBuilder<Item> builder)
        {
            builder.ToTable("items", InventoryContext.DEFAULT_SCHEMA);

            builder.HasKey(o => o.Id);

            builder.Ignore(b => b.DomainEvents);

            builder.Property(o => o.Id)
                .UseHiLo("itemseq", InventoryContext.DEFAULT_SCHEMA);

            builder.Property(x => x.Code).IsRequired();
            builder.Property(x => x.Name).IsRequired();
            builder.Property(x => x.Identity).IsRequired();

            builder
                 .Property<int>("_itemStatusId")
                 .UsePropertyAccessMode(PropertyAccessMode.Field)
                 .HasColumnName("ItemStatusId")
                 .IsRequired();

            builder.HasOne(o => o.ItemStatus)
                .WithMany()
                .HasForeignKey("_itemStatusId");
        }
    }

    public class ItemStatusEntityTypeConfiguration : IEntityTypeConfiguration<ItemStatus>
    {
        public void Configure(EntityTypeBuilder<ItemStatus> builder)
        {
            builder.ToTable("itemstatus", InventoryContext.DEFAULT_SCHEMA);

            builder.HasKey(o => o.Id);

            builder.Property(o => o.Id)
                .HasDefaultValue(1)
                .ValueGeneratedNever()
                .IsRequired();

            builder.Property(o => o.Name)
                .HasMaxLength(200)
                .IsRequired();
        }
    }
}
