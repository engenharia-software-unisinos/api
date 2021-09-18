#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["src/Services/Catalog/Catalog.API/Catalog.API.csproj", "src/Services/Catalog/Catalog.API/"]
COPY ["src/BuildingBlocks/EventBus/BuildingBlocks.IntegrationEventLog/BuildingBlocks.IntegrationEventLog.csproj", "src/BuildingBlocks/EventBus/BuildingBlocks.IntegrationEventLog/"]
COPY ["src/BuildingBlocks/EventBus/BuildingBlocks.EventBus/BuildingBlocks.EventBus.csproj", "src/BuildingBlocks/EventBus/BuildingBlocks.EventBus/"]
COPY ["src/BuildingBlocks/WebHost/BuildingBlocks.WebHost.Customization/BuildingBlocks.WebHost.Customization.csproj", "src/BuildingBlocks/WebHost/BuildingBlocks.WebHost.Customization/"]
COPY ["src/BuildingBlocks/EventBus/BuildingBlocks.EventBusRabbitMQ/BuildingBlocks.EventBusRabbitMQ.csproj", "src/BuildingBlocks/EventBus/BuildingBlocks.EventBusRabbitMQ/"]
COPY ["src/BuildingBlocks/Identity/BuildingBlocks.Identity/BuildingBlocks.Identity.csproj", "src/BuildingBlocks/Identity/BuildingBlocks.Identity/"]
COPY ["src/Services/Catalog/Catalog.Infrastructure/Catalog.Infrastructure.csproj", "src/Services/Catalog/Catalog.Infrastructure/"]
COPY ["src/Services/Catalog/Catalog.Domain/Catalog.Domain.csproj", "src/Services/Catalog/Catalog.Domain/"]
COPY ["src/BuildingBlocks/SeedWork/BuildingBlocks.SeedWork/BuildingBlocks.SeedWork.csproj", "src/BuildingBlocks/SeedWork/BuildingBlocks.SeedWork/"]

COPY "docker-compose.dcproj" "docker-compose.dcproj"

RUN dotnet restore "src/Services/Catalog/Catalog.API/Catalog.API.csproj"

COPY . .
WORKDIR "/src/Services/Catalog/Catalog.API"
RUN dotnet build "Catalog.API.csproj" -c Release -o /app

FROM build AS publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Catalog.API.dll"]