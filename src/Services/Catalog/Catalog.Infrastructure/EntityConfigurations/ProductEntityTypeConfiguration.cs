using Catalog.Domain.AggregatesModel.ProductAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Catalog.Infrastructure.EntityConfigurations
{
    public class ProductEntityTypeConfiguration : IEntityTypeConfiguration<ProductViewModels>
    {
        public void Configure(EntityTypeBuilder<ProductViewModels> builder)
        {
            builder.ToTable("products", CatalogContext.DEFAULT_SCHEMA);

            builder.HasKey(p => p.Id);
            builder.Ignore(p => p.DomainEvents);

            builder.Property(p => p.Id);

            builder.Property(p => p.Code).IsRequired();
            builder.Property(p => p.Name).IsRequired();
            builder.Property(p => p.Description).HasDefaultValue(null);
            builder.Property(p => p.Owner).IsRequired();
            builder.Property(p => p.Price).IsRequired();
            builder.Property(p => p.Amount).IsRequired();

            builder
                .Ignore(x => x.ProductStatus)
                .Property<int>("_productStatusId")
                .UsePropertyAccessMode(PropertyAccessMode.Field)
                .HasColumnName("ProductStatusId")
                .IsRequired();

            builder.HasOne(o => o.ProductStatus)
                .WithMany()
                .HasForeignKey("_productStatusId");

        }
    }
}
