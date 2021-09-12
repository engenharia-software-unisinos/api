using BuildingBlocks.EventBus.Extensions;
using BuildingBlocks.Identity;
using Inventory.API.Application.Commands.CreateOrder;
using Inventory.API.Application.Commands.CreateOrderDraft;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;

namespace Inventory.API.Controllers
{
    [Route("api/v1/[controller]")]
    [Authorize]
    [ApiController]    
    public class OrderController : ControllerBase
    {
        private readonly IMediator _mediator;        
        private readonly IIdentityService _identityService;
        private readonly ILogger<OrderController> _logger;

        public OrderController(IMediator mediator, IIdentityService identityService, ILogger<OrderController> logger)
        {
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(mediator));
            _logger = logger ?? throw new ArgumentNullException(nameof(mediator));
        }

        [Route("")]
        [HttpPost]
        public async Task<IActionResult> CreateOrderFromCartItemsAsync(
            [FromBody] CreateOrderCommand command)
        {
            _logger.LogInformation("---- Sending command: {CommandName} - {IdProperty}: {CommandId} ({@Command})",
                command.GetGenericTypeName(),
                "BuyerId",
                _identityService.GetUserIdentity(),
                command);

            var result = await _mediator.Send(command);

            if (!result) return BadRequest();

            return Ok();
        }

        [Route("draft")]
        [HttpPost]
        public async Task<ActionResult<OrderDraftDTO>> CreateOrderDraftFromCartItemsAsync(
            [FromBody] CreateOrderDraftCommand command)
        {
            _logger.LogInformation("---- Sending command: {CommandName} - {IdProperty}: {CommandId} ({@Command})",
                command.GetGenericTypeName(),
                "BuyerId",
                _identityService.GetUserIdentity(),
                command);

            return await _mediator.Send(command);
        }



        //[Route("cancel")]
        //[HttpPut]
        //[ProducesResponseType((int)HttpStatusCode.OK)]
        //[ProducesResponseType((int)HttpStatusCode.BadRequest)]
        //public async Task<ActionResult> CancelOrderAsync(
        //    string command,
        //    [FromHeader(Name = "x-requed-id")] string requestId)
        //{
        //    bool result = false;

        //    if (Guid.TryParse(requestId, out Guid guid) && guid != Guid.Empty)
        //    {
        //        var identifiedCommand = new IdentifiedCommand<CancelOrderCommand, bool>(command, guid);
        //        //logger
        //        result = await _mediator.Send(identifiedCommand);
        //    }

        //    if (!result)
        //    {
        //        return BadRequest();
        //    }

        //    return Ok();
        //}
    }
}
