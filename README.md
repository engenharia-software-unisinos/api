# Sobre o projeto
O projeto E.Shop foi idealizado utilizando os padrões arquiteturais CQRS (Command Query Responsability Segregation) e Event Sourcing. Seguimos o desenvolvimento utilizando `programação orientada a objetos` aplicando conceitos da `programação orientada a aspectos`.

## Autenticação e Autorização
Utilizamos o Azure Active Directory B2C para lidar com toda autenticação no sistema. A autorização é feita se utilizando do middleware do ASP. NET Core 5.0.

## Aspectos
Dentro do projeto Catalog (src/Services/Catalog.API) e Order (src/Services/Order.API), na pasta application/behaviours, iremos encontrar as classes que se utilizam do conceito de programação orientada a aspectos.

### LoggingBehaviour.cs
Responsável por criar um registro de log de entrada e saída de qualquer comando executado dentro da api.

### ValidatorBehaviour.cs
Responsável por checar se o comando é válido. Utilizamos a biblioteca FluentValidation em conjunto do injetor de dependências AutoFac para injetar as validações de um comando específico e rodar a validação, caso a mesma falhe, o comando não chega nem a ser executado.

### TransactionBehaviour.cs
Antes do comando ser executado, abrimos uma transação no banco de dados utilizando o Entity Framework. Após o comando ter solicitado as modificações (insert, update, delete) necessárias nas entidades e finalizado sua execução, é comitada então a transação com todas as solicitações.

## Frameworks Utilizados
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


# Testes
Os Testes se encontram na pasta de serviços para cada diferente contexto
src/Services/Catalog/Catalog.FunctionalTests
src/Services/Ordering/Ordering.FunctionalTests


# Adicionar Migração no CatalogContext
dotnet ef migrations add Initial_Create --context CatalogContext --project ./src/Services/Catalog/Catalog.API/Catalog.API.csproj --startup-project ./src/Services/Catalog/Catalog.API/Catalog.API.csproj -o Infrastructure/Migrations
dotnet ef migrations add Initial_Create --context IntegrationEventLogContext --project ./src/Services/Catalog/Catalog.API/Catalog.API.csproj --startup-project ./src/Services/Catalog/Catalog.API/Catalog.API.csproj -o Infrastructure/IntegrationEventMigrations

# Adicionar Migration no OrderingContext
dotnet ef migrations add Initial_Create --context OrderingContext --project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj --startup-project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj -o Infrastructure/Migrations
dotnet ef migrations add Initial_Create --context IntegrationEventLogContext --project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj --startup-project ./src/Services/Ordering/Ordering.API/Ordering.API.csproj -o Infrastructure/IntegrationEventMigrations
