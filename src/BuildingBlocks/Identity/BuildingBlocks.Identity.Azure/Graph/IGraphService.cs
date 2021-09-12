using Microsoft.Graph;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BuildingBlocks.Identity.Azure.Graph
{
    public interface IGraphService
    {
        Task<User> FindUserByIdAsync(string id);
        Task<User> FindUserByEmailAsync(string email);
        Task<User> CreateUserAsync(string name, string email, string password, string role, string locatorId, string tenantId);        
        Task DeleteUserAsync(string userId);
    }
}
