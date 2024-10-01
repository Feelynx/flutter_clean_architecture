# Flutter Clean Architecture

This project follows the principles of Clean Architecture, which separates the code into different layers: DTOs, Entities, Data Sources, Repositories, and Use Cases. This separation helps in maintaining a clear structure, making the code more maintainable and testable.

## Users to use the app
the app is realized using the user from Dummy JSON API, you can find the users here:
[https://dummyjson.com/users]

## Layers

1. DTO (Data Transfer Object): Used for transferring data between different layers.
2. Entities: Core business objects of the application.
3. Data Sources: Responsible for data operations, such as fetching from a local database or a remote server.
4. Repositories: Act as a mediator between data sources and use cases.
5. Use Cases: Contain the business logic of the application.
6. Presentation: Manages the state and UI of the application. This is our bloc/cubit/state management plus the UI widget
7. Mappers: Convert between DTOs and Entities.

## DTO
Here’s an example of DTO that inherits from a BaseDTO. The BaseDTO base class helps the process providing a Mixin that is useful for the DTO to Entity conversion.

## Entity
Here’s an example of Entity that inherits from a BaseEntity. The BaseEntity base class helps the process providing a Mixin that is useful for the Entity to DTO conversion.

## Mappers/Adapter
Here the mixin with the Mapper that is implemented in BaseEntity
Here the mixin with the Mapper that is implemented in BaseDTO


## Data Source
Here’s an example of DataSource abstract class and it’s implementation

## Repository
Here’s an example of Repository abstract class and it’s implementation

## UseCase
Here’s an example of UseCase

## Presentation
Here’s an example of Cubit, as State Manager with it’s widget
