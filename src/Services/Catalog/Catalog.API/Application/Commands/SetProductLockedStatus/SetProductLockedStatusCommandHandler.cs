using Catalog.Domain.AggregatesModel.ProductAggregate;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace Catalog.API.Application.Commands.SetProductLockedStatus
{
    public class SetProductLockedStatusCommandHandler : IRequestHandler<SetProductLockedStatusCommand, bool>
    {
        private readonly IProductRepository _productRepository;

        public SetProductLockedStatusCommandHandler(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        public async Task<bool> Handle(SetProductLockedStatusCommand command, CancellationToken cancellationToken)
        {
            var product = await _productRepository.GetAsync(command.ProductId);

            if (product == null) return false;

            product.SetLockedStatus();

            return await _productRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        }
    }
}
