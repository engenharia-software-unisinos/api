using Xunit;

namespace Catalog.FunctionalTests.Utils
{
    [CollectionDefinition("Functional")]
    public class AppFixtureCollectionConnector : ICollectionFixture<AppFixture>
    {

    }
}
