using System;

namespace Catalog.API.Application.Queries
{
    public record Product
    {
        public int id { get; init; }
        public string code { get; init; }
        public Guid owner { get; init; }
        public string name { get; init; }
        public string description { get; init; }
        public decimal price { get; init; }
        public int amount { get; init; }
        public DateTime createdAt { get; init; }
        public DateTime updatedAt { get; init; }
    }

    public record ProductStatus
    {
        public int id { get; init; }
        public string name { get; init; }
    }
}
