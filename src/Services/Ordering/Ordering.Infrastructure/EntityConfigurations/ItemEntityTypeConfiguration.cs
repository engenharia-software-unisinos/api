using Ordering.Domain.AggregatesModel.ItemAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Ordering.Infrastructure.EntityConfigurations
{
    public class ItemEntityTypeConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.ToTable("items", OrderingContext.DEFAULT_SCHEMA);

            builder.HasKey(o => o.Id);

            builder.Ignore(b => b.DomainEvents);

            builder.Property(o => o.Id)
                .UseHiLo("itemseq", OrderingContext.DEFAULT_SCHEMA);

            builder.Property(x => x.Code).IsRequired();
            builder.Property(x => x.Name).IsRequired();
            builder.Property(x => x.Identity).IsRequired();

            builder
                 .Property<int>("_itemStatusId")
                 .UsePropertyAccessMode(PropertyAccessMode.Field)
                 .HasColumnName("ItemStatusId")
                 .IsRequired();

            builder.HasOne(o => o.ProductStatus)
                .WithMany()
                .HasForeignKey("_itemStatusId");
        }
    }

    public class ItemStatusEntityTypeConfiguration : IEntityTypeConfiguration<ProductStatus>
    {
        public void Configure(EntityTypeBuilder<ProductStatus> builder)
        {
            builder.ToTable("itemstatus", OrderingContext.DEFAULT_SCHEMA);

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
