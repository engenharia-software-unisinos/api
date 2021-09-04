using System;

namespace Inventory.API.Infrastructure.Services
{
    public interface IIdentityService
    {
        Guid GetUserIdentity();

        string GetUserName();
    }
}
