# Sobre o projeto
O projeto E.Shop foi idealizado utilizando os padrões arquiteturais CQRS (Command Query Responsability Segregation) e Event Sourcing. Seguimos o desenvolvimento utilizando `programação orientada a objetos` aplicando conceitos da `programação orientada a aspectos`.

## Build With
* [ASP .NET Core 5.0]()
* [Entity Framework]()



# Setup do ambiente

1. Instale o [docker](https://www.docker.com)
2. Na pasta ./src/ do projeto, rode o seguinte comando:
```yml
docker-compose up -d --force-recreate --remove-orphans
```
3. Para parar o projeto no docker, rode:
```
docker-compose stop && docker-compose rm -f
```

# Links ambiente de desenvolvimento
* [catalog api](https://localhost:5101)
* [order api](https://localhost:5102)
* [seq server](https://localhost:5340)
* [rabbit panel](https://localhost:15672)


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
