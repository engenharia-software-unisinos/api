using BuildingBlocks.FunctionalTests.Utils;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;

namespace BuildingBlocks.FunctionalTests.Extensions
{
    public static class HttpClientExtensions
    {
        public static StringContent ToStringContent(this object data)
        {
            var json = data == null ? string.Empty : JsonConvert.SerializeObject(data);
            return new StringContent(json, Encoding.UTF8, "application/json");
        }

        public static MultipartFormDataContent ToMultipartFormDataContent(this Dictionary<string, object> src)
        {
            var formDataBoundary = string.Format("----------{0:N}", Guid.NewGuid());
            var formData = new MultipartFormDataContent(formDataBoundary);

            foreach (var kvp in src)
            {
                if (kvp.Value.GetType() == typeof(string))
                {

                    formData.Add(new StringContent(kvp.Value as string), kvp.Key);
                }
                if (kvp.Value.GetType() == typeof(string[]))
                {
                    var arr = kvp.Value as string[];
                    foreach (var item in arr)
                    {
                        formData.Add(new StringContent(item), kvp.Key);
                    }
                }
                else if (kvp.Value.GetType() == typeof(File))
                {
                    var content = new ByteArrayContent((kvp.Value as File).Bytes);
                    formData.Add(content, kvp.Key, (kvp.Value as File).FileName);
                }
            }

            return formData;
        }
    }
}
