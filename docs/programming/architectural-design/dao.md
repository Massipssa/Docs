The **DAO – Data Access Object** pattern encapsulates all the logic for accessing data sources (like databases or APIs).
It abstracts and hides the details of data access from the rest of the application.

!!! tip
    🧠 Think of it as: ***A service class that talks to the database.***

- Example

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