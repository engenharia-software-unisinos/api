using FluentValidation;
using Ordering.API.Application.Commands.CreateOrder;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Linq;

namespace Ordering.API.Application.Validations
{
    public class CreateOrderCommandValidator : AbstractValidator<CreateOrderCommand>
    {
        public CreateOrderCommandValidator(ILogger<CreateOrderCommandValidator> logger)
        {
            RuleFor(x => x.OrderItems).Must(ContainOrderItems).WithMessage("No order items found");

            logger.LogTrace("---- INSTANCE CREATED - {ClassName}", GetType().Name);
        }

        private bool ContainOrderItems(IEnumerable<OrderItemDTO> orderItems)
        {
            return orderItems.Any();
        }
    }
}
