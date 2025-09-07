# DTO (Data Transfer Object)

A **DTO (Data Transfer Object)** is a lightweight, serializable object designed to transfer data between different layers or systems in an application. DTOs are commonly used for:

- Client ↔ Server communication
- API ↔ Service interactions
- Service ↔ Data Access Object (DAO) exchanges

DTOs typically contain only fields and minimal logic (such as basic validation or formatting). They help decouple internal domain models from external representations, making code easier to maintain, test, and evolve.

:::tip
🧠 **Think of a DTO as:**  
*A suitcase full of data that travels safely between layers.*
:::

## Example

```scala
// DTO representing input from a web form or JSON
case class UserDTO(name: String)

// Service that converts DTO into a domain model
class UserService(userDAO: UserDAO) {
  def createUser(dto: UserDTO): Unit = {
    val user = User(id = 0, name = dto.name) // Convert DTO to domain model
    userDAO.save(user)
  }
}
```

## Why Use DTOs?

- **Encapsulation:** Hide internal domain models from external consumers.
- **Validation:** Centralize input validation and formatting.
- **Decoupling:** Reduce dependencies between layers, making refactoring easier.
- **Performance:** Transfer only necessary data, reducing payload size.
- **Security:** Prevent leaking sensitive internal fields to external consumers.

## Common Patterns

- DTOs are often used with serialization frameworks (JSON, XML).
- They can be auto-generated from API specifications (OpenAPI, Swagger).
- Mapping between DTOs and domain models is often handled by libraries (e.g., MapStruct, ModelMapper).
- DTOs can be versioned to support backward compatibility in APIs.

## Best Practices

- Keep DTOs simple and focused on data representation.
- Avoid business logic in DTOs; use them only for data transfer.
- Use explicit mapping between DTOs and domain models to avoid accidental data leaks.
- Document DTOs clearly to ensure correct usage across teams and services.
