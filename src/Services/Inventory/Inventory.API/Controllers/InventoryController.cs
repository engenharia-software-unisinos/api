using Inventory.API.Application.Queries;
using Inventory.API.Infrastructure.Services;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Inventory.API.Controllers
{
    [Route("api/v1/[controller]")]
    [Authorize]
    [ApiController]
    public class InventoryController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly IInventoryQueries _inventoryQueries;
        private readonly IIdentityService _identityService;
        private readonly ILogger<InventoryController> _logger;
    }
}
