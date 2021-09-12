using System;

namespace Ordering.API.Application.Queries
{
    public record Item
    {
        public int id { get; init; }
        public string name { get; init; }
        public string identity { get; init; }
        public DateTime createdAt { get; init; }
        public DateTime updatedAt { get; init; }
    }
}
