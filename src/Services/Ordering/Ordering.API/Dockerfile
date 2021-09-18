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
COPY ["src/BuildingBlocks/WebHost/BuildingBlocks.WebHost.Customization/BuildingBlocks.WebHost.Customization.csproj", "src/BuildingBlocks/WebHost/BuildingBlocks.WebHost.Customization/"]
COPY ["src/BuildingBlocks/EventBus/BuildingBlocks.EventBusRabbitMQ/BuildingBlocks.EventBusRabbitMQ.csproj", "src/BuildingBlocks/EventBus/BuildingBlocks.EventBusRabbitMQ/"]
COPY ["src/BuildingBlocks/Identity/BuildingBlocks.Identity/BuildingBlocks.Identity.csproj", "src/BuildingBlocks/Identity/BuildingBlocks.Identity/"]
COPY ["src/Services/Ordering/Ordering.Domain/Ordering.Domain.csproj", "src/Services/Ordering/Ordering.Domain/"]
COPY ["src/BuildingBlocks/SeedWork/BuildingBlocks.SeedWork/BuildingBlocks.SeedWork.csproj", "src/BuildingBlocks/SeedWork/BuildingBlocks.SeedWork/"]
COPY ["src/Services/Ordering/Ordering.Infrastructure/Ordering.Infrastructure.csproj", "src/Services/Ordering/Ordering.Infrastructure/"]
RUN dotnet restore "src/Services/Ordering/Ordering.API/Ordering.API.csproj"
COPY . .
WORKDIR "/src/src/Services/Ordering/Ordering.API"
RUN dotnet build "Ordering.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Ordering.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Ordering.API.dll"]
