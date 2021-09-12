using System.Text.Json.Serialization;

namespace BuildingBlocks.FunctionalTests
{
    public class TokenResponse
    {
        [JsonPropertyName("access_token")]
        public string AccessToken { get; set; }
    }
}
