#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src

COPY ["src/Services/Ordering/Ordering.API/Ordering.API.csproj", "src/Services/Ordering/Ordering.API/"]
COPY ["src/BuildingBlocks/EventBus/BuildingBlocks.IntegrationEventLog/BuildingBlocks.IntegrationEventLog.csproj", "src/BuildingBlocks/EventBus/BuildingBlocks.IntegrationEventLog/"]
COPY ["src/BuildingBlocks/EventBus/BuildingBlocks.EventBus/BuildingBlocks.EventBus.csproj", "src/BuildingBlocks/EventBus/BuildingBlocks.EventBus/"]
COPY ["src/Services/Ordering/Ordering.Infrastructure/Ordering.Infrastructure.csproj", "src/Services/Ordering/Ordering.Infrastructure/"]
COPY ["src/Services/Ordering/Ordering.Domain/Ordering.Domain.csproj", "src/Services/Ordering/Ordering.Domain/"]
COPY ["src/BuildingBlocks/WebHost/BuildingBlocks.WebHost.Customization/BuildingBlocks.WebHost.Customization.csproj", "src/BuildingBlocks/WebHost/BuildingBlocks.WebHost.Customization/"]
COPY ["src/BuildingBlocks/EventBus/BuildingBlocks.EventBusRabbitMQ/BuildingBlocks.EventBusRabbitMQ.csproj", "src/BuildingBlocks/EventBus/BuildingBlocks.EventBusRabbitMQ/"]

COPY "docker-compose.dcproj" "docker-compose.dcproj"

RUN dotnet restore "src/Services/Ordering/Ordering.API/Ordering.API.csproj"

COPY . .
WORKDIR "/src/Services/Ordering/Ordering.API"
RUN dotnet build "Ordering.API.csproj" -c Release -o /app

FROM build AS publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Ordering.API.dll"]