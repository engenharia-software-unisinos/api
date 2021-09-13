using BuildingBlocks.Identity;
using Catalog.Domain.AggregatesModel.ProductAggregate;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Catalog.API.Application.Commands.CreateProduct
{
    public class CreateProductCommandHandler : IRequestHandler<CreateProductCommand, ProductDTO>
    {
        private readonly IProductRepository _productRepository;
        private readonly IIdentityService _identityService;
        private readonly ILogger<CreateProductCommandHandler> _logger;

        public CreateProductCommandHandler(
            IProductRepository productRepository,
            IIdentityService identityService,
            ILogger<CreateProductCommandHandler> logger)
        {
            _productRepository = productRepository ?? throw new ArgumentNullException(nameof(productRepository));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        public async Task<ProductDTO> Handle(CreateProductCommand message, CancellationToken cancellationToken)
        {
            var userId = _identityService.GetUserIdentity();
            var product = new ProductViewModels(message.Code, userId, message.Name, message.Description, message.Price, message.Amount);

            _logger.LogInformation("----- Creating Product - Product: {@Product}", product);

            product = _productRepository.Add(product);

            if (!await _productRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken))
                return null;

            return ProductDTO.FromItem(product);
        }
    }

    public record ProductDTO
    {
        public int Id { get; init; }
        public Guid Owner { get; init; }
        public string Name { get; init; }
        public DateTime CreatedAt { get; init; }

        public static ProductDTO FromItem(ProductViewModels product)
        {
            return new ProductDTO()
            {
                Id = product.Id,
                Owner = product.Owner,
                Name = product.Name,
                CreatedAt = product.CreatedAt
            };
        }
    }
}
