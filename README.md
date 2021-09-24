#Testes
Testes se encontram na pasta de serviços para cada diferente contexto
src/Services/Catalog/Catalog.FunctionalTests
src/Services/Ordering/Ordering.FunctionalTests


# Migration CatalogContext
dotnet ef migrations add Initial_Create --context CatalogContext --project ./src/Services/Catalog/Catalog.API/Catalog.API.csproj --startup-project ./src/Services/Catalog/Catalog.API/Catalog.API.csproj -o Infrastructure/Migrations
dotnet ef migrations add Initial_Create --context IntegrationEventLogContext --project ./src/Services/Catalog/Catalog.API/Catalog.API.csproj --startup-project ./src/Services/Catalog/Catalog.API/Catalog.API.csproj -o Infrastructure/IntegrationEventMigrations

# Migration OrderingContext
dotnet ef migrations add Initial_Create --context OrderingContext --project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj --startup-project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj -o Infrastructure/Migrations
dotnet ef migrations add Initial_Create --context IntegrationEventLogContext --project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj --startup-project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj -o Infrastructure/IntegrationEventMigrations