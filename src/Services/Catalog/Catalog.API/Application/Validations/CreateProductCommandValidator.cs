using Catalog.API.Application.Commands.CreateProduct;
using FluentValidation;
using Microsoft.Extensions.Logging;

namespace Catalog.API.Application.Validations
{
    public class CreateProductCommandValidator : AbstractValidator<CreateProductCommand>
    {
        public CreateProductCommandValidator(ILogger<CreateProductCommandValidator> logger)
        {
            RuleFor(command => command.Code).NotEmpty();
            RuleFor(command => command.Name).NotEmpty();
            RuleFor(command => command.Price).GreaterThan(0);
            RuleFor(command => command.Amount).GreaterThan(0);

            logger.LogTrace("---- INSTANCE CREATED - {ClassName}", GetType().Name);
        }
    }
}
