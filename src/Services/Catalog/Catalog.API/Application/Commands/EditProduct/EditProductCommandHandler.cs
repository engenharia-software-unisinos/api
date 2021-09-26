using Catalog.Domain.AggregatesModel.ProductAggregate;
using BuildingBlocks.Identity;
using MediatR;
using Microsoft.Extensions.Logging;
using System.Threading;
using System.Threading.Tasks;
using System;

namespace Catalog.API.Application.Commands.EditProduct
{
    public class EditProductCommandHandler : IRequestHandler<EditProductCommand, bool>
    {
        private readonly IProductRepository _productRepository;
        private readonly IIdentityService _identityService;
        private readonly ILogger<EditProductCommandHandler> _logger;

        public EditProductCommandHandler(IProductRepository productRepository, IIdentityService identityService, ILogger<EditProductCommandHandler> logger)
        {
            _productRepository = productRepository;
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _logger = logger;
        }

        public async Task<bool> Handle(EditProductCommand request, CancellationToken cancellationToken)
        {
            var userId = _identityService.GetUserIdentity();
            var product = await _productRepository.GetAsync(request.ProductId);
 
            if (product == null) return false;

            product.Code = request.Code;
            product.Owner = userId;
            product.Name = request.Name;
            product.Description = request.Description;
            product.Price = request.Price;
            product.Amount = request.Amount;

            _logger.LogInformation("----- Edit Product - Product: {@Product}", product);

            _productRepository.Update(product);

            return await _productRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        }
    }
}
