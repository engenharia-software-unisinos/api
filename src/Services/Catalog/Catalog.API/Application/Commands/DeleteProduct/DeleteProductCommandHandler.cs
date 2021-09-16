using Catalog.Domain.AggregatesModel.ProductAggregate;
using MediatR;
using Microsoft.Extensions.Logging;
using System.Threading;
using System.Threading.Tasks;

namespace Catalog.API.Application.Commands.DeleteProduct
{
    public class DeleteProductCommandHandler : IRequestHandler<DeleteProductCommand, bool>
    {
        private readonly IProductRepository _productRepository;        
        private readonly ILogger<DeleteProductCommandHandler> _logger;

        public DeleteProductCommandHandler(IProductRepository productRepository, ILogger<DeleteProductCommandHandler> logger)
        {
            _productRepository = productRepository;
            _logger = logger;
        }

        public async Task<bool> Handle(DeleteProductCommand request, CancellationToken cancellationToken)
        {
            var product = await _productRepository.GetAsync(request.ProductId);

            if (product == null) return false;

            _logger.LogInformation("----- Removing Product - Product: {@Product}", product);

            _productRepository.Remove(product);

            return await _productRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        }
    }
}
