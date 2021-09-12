using System;

namespace BuildingBlocks.Identity
{
    public interface IIdentityService
    {
        Guid GetUserIdentity();
        string GetUserName();
    }
}
