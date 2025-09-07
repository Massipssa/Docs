A **DTO – Data Transfer Object** is a plain object used to transfer data between layers or systems, especially between:

- Client and server
- API and service
- Service and DAO

It usually contains no logic, only fields (and maybe some formatting/validation).

!!! tip
    🧠 Think of it as: ***A suitcase full of data that travels across layers.***

## Example

```scala
// DTO representing input from a web form or JSON
case class UserDTO(name: String)

// Service that converts DTO into a domain model
class UserService(userDAO: UserDAO) {
  def createUser(dto: UserDTO): Unit = {
    val user = User(0, dto.name) // Convert DTO to domain model
    userDAO.save(user)
  }
}

```