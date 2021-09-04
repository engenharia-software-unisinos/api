#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src

COPY ["src/Services/Inventory/Inventory.API/Inventory.API.csproj", "src/Services/Inventory/Inventory.API/"]
COPY ["src/BuildingBlocks/EventBus/BuildingBlocks.IntegrationEventLog/BuildingBlocks.IntegrationEventLog.csproj", "src/BuildingBlocks/EventBus/BuildingBlocks.IntegrationEventLog/"]
COPY ["src/BuildingBlocks/EventBus/BuildingBlocks.EventBus/BuildingBlocks.EventBus.csproj", "src/BuildingBlocks/EventBus/BuildingBlocks.EventBus/"]
COPY ["src/Services/Inventory/Inventory.Infrastructure/Inventory.Infrastructure.csproj", "src/Services/Inventory/Inventory.Infrastructure/"]
COPY ["src/Services/Inventory/Inventory.Domain/Inventory.Domain.csproj", "src/Services/Inventory/Inventory.Domain/"]
COPY ["src/BuildingBlocks/WebHost/BuildingBlocks.WebHost.Customization/BuildingBlocks.WebHost.Customization.csproj", "src/BuildingBlocks/WebHost/BuildingBlocks.WebHost.Customization/"]
COPY ["src/BuildingBlocks/EventBus/BuildingBlocks.EventBusRabbitMQ/BuildingBlocks.EventBusRabbitMQ.csproj", "src/BuildingBlocks/EventBus/BuildingBlocks.EventBusRabbitMQ/"]

COPY "docker-compose.dcproj" "docker-compose.dcproj"

RUN dotnet restore "src/Services/Inventory/Inventory.API/Inventory.API.csproj"

COPY . .
WORKDIR "/src/Services/Inventory/Inventory.API"
RUN dotnet build "Inventory.API.csproj" -c Release -o /app

FROM build AS publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Inventory.API.dll"]