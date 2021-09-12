using Xunit;

namespace Ordering.FunctionalTests.Utils
{
    [CollectionDefinition("Integration")]
    public class AppFixtureCollectionConnector : ICollectionFixture<AppFixture>
    {

    }
}
