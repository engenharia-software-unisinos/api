using Microsoft.AspNetCore.Http;
using System;
using System.Security.Claims;

namespace Inventory.API.Infrastructure.Services
{
    public class IdentityService : IIdentityService
    {
        private IHttpContextAccessor _context;

        public IdentityService(IHttpContextAccessor context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public Guid GetUserIdentity()
        {
            return Guid.Parse(_context.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value);
        }

        public string GetUserName()
        {
            return _context.HttpContext.User.Identity.Name;
        }
    }
}
