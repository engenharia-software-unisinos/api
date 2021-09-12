using Ordering.Domain.AggregatesModel.ItemAggregate;
using MediatR;
using System.Runtime.Serialization;
using System.Threading;
using System.Threading.Tasks;

namespace Ordering.API.Application.Commands
{
    public class RemoveItemCommand : IRequest<bool>
    {
        public RemoveItemCommand()
        {

        }
        public RemoveItemCommand(int itemId)
        {
            ItemId = itemId;
        }

        [DataMember]
        public int ItemId { get; set; }
    }

    public class RemoveItemCommandHandler : IRequestHandler<RemoveItemCommand, bool>
    {
        private readonly IProductRepository _itemRepository;

        public RemoveItemCommandHandler(IProductRepository itemRepository)
        {
            _itemRepository = itemRepository;
        }

        public async Task<bool> Handle(RemoveItemCommand request, CancellationToken cancellationToken)
        {
            var item = await _itemRepository.GetAsync(request.ItemId);
            if (item == null) return false;

            item.SetRemovedStatus();
            return await _itemRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        }
    }
}
