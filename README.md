
# Migration InventoryContext
dotnet ef migrations add Initial_Create --context InventoryContext --project ./src/Services/Inventory/Inventory.API/Inventory.API.csproj --startup-project ./src/Services/Inventory/Inventory.API/Inventory.API.csproj -o Infrastructure/Migrations

# Migration IntegrationEventLogContext
dotnet ef migrations add Initial_Create --context IntegrationEventLogContext --project ./src/Services/Inventory/Inventory.API/Inventory.API.csproj --startup-project ./src/Services/Inventory/Inventory.API/Inventory.API.csproj -o Infrastructure/IntegrationEventMigrations