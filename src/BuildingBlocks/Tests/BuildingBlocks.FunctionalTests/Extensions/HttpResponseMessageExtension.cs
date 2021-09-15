using System.Net.Http;
using System.Text.Json;

namespace BuildingBlocks.FunctionalTests.Extensions
{
    public static class HttpResponseMessageExtension
    {
        public static T Deserialize<T>(this HttpResponseMessage response)
        {
            return JsonSerializer.Deserialize<T>(response.Content.ReadAsStringAsync().Result);
        }
    }
}
