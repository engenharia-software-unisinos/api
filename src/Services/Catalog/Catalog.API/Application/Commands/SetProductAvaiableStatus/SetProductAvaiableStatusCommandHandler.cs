using Catalog.Domain.AggregatesModel.ProductAggregate;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace Catalog.API.Application.Commands.SetProductAvaiableStatus
{
    public class SetProductAvaiableStatusCommandHandler : IRequestHandler<SetProductAvaiableStatusCommand, bool>
    {
        private readonly IProductRepository _productRepository;

        public SetProductAvaiableStatusCommandHandler(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        public async Task<bool> Handle(SetProductAvaiableStatusCommand command, CancellationToken cancellationToken)
        {
            var product = await _productRepository.GetAsync(command.ProductId);

            if (product == null) return false;

            product.SetAvaiableStatus();

            return await _productRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        }
    }
}
