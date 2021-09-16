using Catalog.API.Application.Commands.DeleteProduct;
using FluentValidation;
using Microsoft.Extensions.Logging;

namespace Catalog.API.Application.Validations
{
    public class DeleteProductCommandValidator : AbstractValidator<DeleteProductCommand>
    {
        public DeleteProductCommandValidator(ILogger<DeleteProductCommandValidator> logger)
        {
            RuleFor(command => command.ProductId).GreaterThan(0);

            logger.LogTrace("---- INSTANCE CREATED - {ClassName}", GetType().Name);
        }
    }
}
