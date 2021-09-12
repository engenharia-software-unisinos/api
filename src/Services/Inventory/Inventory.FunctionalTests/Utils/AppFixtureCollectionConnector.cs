using Xunit;

namespace Inventory.FunctionalTests.Utils
{
    [CollectionDefinition("Integration")]
    public class AppFixtureCollectionConnector : ICollectionFixture<AppFixture>
    {

    }
}
