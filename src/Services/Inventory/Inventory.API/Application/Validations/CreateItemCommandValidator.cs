using FluentValidation;
using Inventory.API.Application.Commands;
using Microsoft.Extensions.Logging;

namespace Inventory.API.Application.Validations
{
    public class CreateItemCommandValidator : AbstractValidator<CreateItemCommand>
    {
        public CreateItemCommandValidator(ILogger<CreateItemCommandValidator> logger)
        {
            RuleFor(command => command.Name).NotEmpty();

            logger.LogTrace("---- INSTANCE CREATED - {ClassName}", GetType().Name);
        }
    }
}
