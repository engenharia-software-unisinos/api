using BuildingBlocks.EventBus.Extensions;
using BuildingBlocks.Identity;
using Catalog.API.Application.Commands.CreateProduct;
using Catalog.API.Application.Queries;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace Catalog.API.Controllers
{
    [Route("api/v1/[controller]")]
    [Authorize]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly IProductQueries _productQueries;
        private readonly IIdentityService _identityService;
        private readonly ILogger<ProductController> _logger;

        public ProductController(IMediator mediator, IProductQueries productQueries, IIdentityService identityService, ILogger<ProductController> logger)
        {
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _productQueries = productQueries ?? throw new ArgumentNullException(nameof(productQueries));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        [Route("")]
        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<Product>), (int)HttpStatusCode.OK)]
        public async Task<ActionResult<IEnumerable<Product>>> GetProducts()
        {
            var products = await _productQueries.GetProductsAsync();

            return Ok(products);
        }

        [Route("{productId:int}")]
        [HttpGet]
        [ProducesResponseType(typeof(Product), (int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.NotFound)]
        public async Task<ActionResult<IEnumerable<ProductStatus>>> GetProduct(int productId)
        {
            try
            {
                var product = await _productQueries.GetProductAsync(productId);
                return Ok(product);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("")]
        [HttpPost]
        public async Task<IActionResult> CreateProduct(
            [FromBody] CreateProductCommand command)
        {
            _logger.LogInformation("---- Sending command: {CommandName} - {IdProperty}: {CommandId} ({@Command})",
                command.GetGenericTypeName(),
                "OwnerId",
                _identityService.GetUserIdentity(),
                command);

            var result = await _mediator.Send(command);            

            return Ok(result);
        }

        [Route("product-status")]
        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<ProductStatus>), (int)HttpStatusCode.OK)]
        public async Task<ActionResult<IEnumerable<ProductStatus>>> GetProductStatusAsync()
        {
            var productStatus = await _productQueries.GetProductStatusAsync();

            return Ok(productStatus);
        }
    }
}
