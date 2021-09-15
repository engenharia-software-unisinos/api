using System.Collections.Generic;

namespace Catalog.FunctionalTests.Utils
{
    public class AppFixture
    {
        public Dictionary<string, object> Data { get; set; }
        public AppFixture()
        {
            Data = new Dictionary<string, object>();
        }
    }
}
