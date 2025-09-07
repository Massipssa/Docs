# DAO (Data Access Object)

The **DAO (Data Access Object)** pattern encapsulates all logic for accessing data sources (such as databases, files, or external APIs). It abstracts and hides the details of data access from the rest of the application, promoting separation of concerns and easier maintenance.

:::tip
🧠 **Think of a DAO as:**  
*A dedicated service class that handles all communication with the database or data source.*
:::

## Benefits

- **Separation of Concerns:** Keeps business logic separate from data access logic.
- **Testability:** Enables mocking or stubbing data access for unit tests.
- **Maintainability:** Centralizes data access code, making it easier to update or refactor.
- **Flexibility:** Supports switching data sources (e.g., from SQL to NoSQL) with minimal changes to business logic.

## Example

```scala
// Model class
case class User(id: Int, name: String)

// DAO interface
trait UserDAO {
  def findById(id: Int): Option[User]
  def save(user: User): Unit
}

// DAO implementation (e.g., using JDBC or an ORM)
class UserDAOImpl extends UserDAO {
  override def findById(id: Int): Option[User] = {
    // Database query logic here
    Some(User(id, "Alice"))
  }

  override def save(user: User): Unit = {
    // Insert or update logic here
    println(s"Saved user: $user")
  }
}
```

## Best Practices

- Define DAO interfaces to enable easy swapping of implementations.
- Keep DAOs focused on data operations (CRUD: Create, Read, Update, Delete).
- Avoid business logic in DAOs; keep them strictly for data access.
- Use dependency injection to manage DAO instances.

## Related Patterns

- **Repository Pattern:** Provides a higher-level abstraction over DAOs, often used in Domain-Driven Design.
- **DTO (Data Transfer Object):** Used to transfer data between layers, often in conjunction
