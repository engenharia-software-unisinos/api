using FluentValidation;
using Inventory.API.Application.Commands.CreateOrderDraft;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Linq;

namespace Inventory.API.Application.Validations
{
    public class CreateOrderDraftCommandValidator : AbstractValidator<CreateOrderDraftCommand>
    {
        public CreateOrderDraftCommandValidator(ILogger<CreateOrderCommandValidator> logger)
        {
            RuleFor(x => x.CartItems).Must(ContainCartItems).WithMessage("No cart items found");

            logger.LogTrace("---- INSTANCE CREATED - {ClassName}", GetType().Name);
        }

        private bool ContainCartItems(IEnumerable<Models.CartItem> orderItems)
        {
            return orderItems.Any();
        }
    }
}
