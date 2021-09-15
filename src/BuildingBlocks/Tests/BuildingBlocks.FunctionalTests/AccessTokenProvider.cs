using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text.Json;
using System.Threading.Tasks;

namespace BuildingBlocks.FunctionalTests
{
    public class AccessTokenProvider
    {
        private readonly TestSettings _settings;
        private readonly HttpClient _client;

        private string _accessToken;

        public AccessTokenProvider(TestSettings settings)
        {
            _settings = settings;
            _client = new HttpClient();
        }

        /// <summary>
        /// Authenticates the request as a user,
        /// with delegated permissions.
        /// </summary>
        /// <param name="req">The request to authenticate</param>
        public async Task AuthenticateClientAsUserAsync(HttpClient client)
        {
            if (client == null) throw new ArgumentNullException(nameof(client));

            if (string.IsNullOrEmpty(_accessToken))
            {
                var tokenReq = new HttpRequestMessage(HttpMethod.Post, _settings.UserAuthentication.TokenUrl)
                {
                    Content = new FormUrlEncodedContent(new Dictionary<string, string>
                    {
                        ["grant_type"] = "password",
                        ["username"] = _settings.UserAuthentication.Username,
                        ["password"] = _settings.UserAuthentication.Password,
                        ["client_id"] = _settings.UserAuthentication.ClientId,
                        ["client_secret"] = _settings.UserAuthentication.ClientSecret,
                        ["scope"] = $"{_settings.ApiAppIdUri}/pampadevs.read {_settings.ApiAppIdUri}/pampadevs.write"
                    })
                };

                var res = await _client.SendAsync(tokenReq);

                string json = await res.Content.ReadAsStringAsync();
                var tokenResponse = JsonSerializer.Deserialize<TokenResponse>(json);
                _accessToken = tokenResponse.AccessToken;
            }

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _accessToken);
        }

        public void Clear()
        {
            _accessToken = null;
        }
    }
}
