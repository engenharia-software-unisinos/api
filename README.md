
# Migration OrderingContext
dotnet ef migrations add Initial_Create --context OrderingContext --project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj --startup-project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj -o Infrastructure/Migrations

# Migration IntegrationEventLogContext
dotnet ef migrations add Initial_Create --context IntegrationEventLogContext --project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj --startup-project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj -o Infrastructure/IntegrationEventMigrations