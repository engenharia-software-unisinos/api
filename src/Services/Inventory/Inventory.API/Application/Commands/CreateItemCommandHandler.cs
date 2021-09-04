using Inventory.API.Application.IntegrationEvents;
using Inventory.API.Application.IntegrationEvents.Events;
using Inventory.API.Infrastructure.Services;
using Inventory.Domain.AggregatesModel.ItemAggregate;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Inventory.API.Application.Commands
{
    public class CreateItemCommandHandler : IRequestHandler<CreateItemCommand, ItemDTO>
    {
        private readonly IProductRepository _itemRepository;
        private readonly IIdentityService _identityService;
        private readonly ILogger<CreateItemCommandHandler> _logger;

        public CreateItemCommandHandler(
            IProductRepository itemRepository, 
            IIdentityService identityService, 
            ILogger<CreateItemCommandHandler> logger)
        {
            _itemRepository = itemRepository ?? throw new ArgumentNullException(nameof(itemRepository));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        public async Task<ItemDTO> Handle(CreateItemCommand message, CancellationToken cancellationToken)
        {
            var userId = _identityService.GetUserIdentity();
            var item = new Product(message.Code, userId, message.Name);

            _logger.LogInformation("----- Creating Item - Item: {@Item}", item);

            item = _itemRepository.Add(item);

            if(!await _itemRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken))
                return null;

            return ItemDTO.FromItem(item);
        }
    }

    public record ItemDTO
    {
        public int Id { get; init; }
        public Guid Identity { get; init; }
        public string Name { get; init; }
        public DateTime CreatedAt { get; init; }

        public static ItemDTO FromItem(Product item)
        {
            return new ItemDTO()
            {
                Id = item.Id,
                Identity = item.Identity,
                Name = item.Name,
                CreatedAt = item.CreatedAt
            };
        }
    }
}
