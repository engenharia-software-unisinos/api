using MediatR;

namespace Inventory.API.Application.Commands
{
    public class CreateItemCommand : IRequest<ItemDTO>
    {
        public CreateItemCommand(string code, string name)
        {
            Code = code;
            Name = name;
        }

        public string Code { get; private set; }
        public string Name { get; private set; }
    }   
}
