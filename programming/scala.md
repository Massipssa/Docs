## Scala 
- **case class:** 
    - Implement immutable data 
    - Useful for Pattern match 
    - No need to use ***new*** to create an object (implement apply method)
    - Methods: toString, equal (shallow copy)

- **object**
  - Class that have only one object (singleton)
  - It's created lazy
  
- **case object**
    - It's serializable
    - Has a default **hashCode** implementation
    - Has an improved implementation of **toString**
    - Can access private elements of its companion class
    
- **High order function:** 
    - Function that takes other function as parameter 
    - Return other function 

- **Try/ Catch** 
    - Traditional try/catch allows to catch all suspected block using **case** statement

- **Curring**

- **Abstract class vs Trait**
    - Abstract: to be used when
        - We require consustructor argument
        - Code will be called by java
        - class ***Extends only one abstract class***
  
## Sbt 
### Commands 
* clean, compile, package, update, test,  inspect,... 


## Test
### ScalaTest 
