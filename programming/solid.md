# SOLID

- When not applied
    - **Code fragility:** change in one module may create bugs in other modules
    - **Code rigidity:** change in one place will imply change in other places
    - 
## Single Responsibility Principal (SRP)

- Every method, class or module should have only one and only one reason to change
- Pros
  - Class less coupled and resilient for change 
  - Make code more testable
  - Code easy to understand, fix and maintain 
- Identify the reason to change
  - if and else statement
  - switch cases 
  - monster methods (long methods): identify the small responsibilities and put them in separates methods
  - God classes: classes with multiple responsibilities

## Open Closed Principal (OCP) 

- Closed for modification and Open for extension
- Pros:
  - New feature can be added easily with minimal cost 
  - Minimize the risk of creating regression bugs 
  - Enforce the decoupling by isolating the changes in one specific component (Respects the SRP)

- Who to do
  - Inheritance (small drawback: create coupling between base class and derived class)
  - Strategy pattern 

## Liskov Substitution Principal (LSP)

- If S is subtype of T, then the objects of the type T in the program may be replaced by objects of type S
without modifying the functionality of the program.   
- Every time when creating a relationship between object as the question ***Is substitutable by***
- Example: Base class Bird, subclass Ostrich but an Ostrich can't fly 
- Pros
  - Eliminates incorrect relationship between objects 
  - Use ***Tell, don't ask!*** principal to eliminate type checking and casting
- How to apply
  - Make sure that a derived type can substitute its base type completely
  - Keep base class small and focus 
  - Keep interfaces lean 

## Interface Segregation Principal (ISP)
- Client shouldn't be forced to depend on the methods they do not use
- How to identify flat interface
  - Interface with multiple methods
  - Interface with Low Cohesion (method that doesn't fit with the purpose of the interface)
  - Client that throws exception instead implementing method 
  - Client provides empty implementation 
  - Client forces implementation and becomes highly coupled

## Dependency Inversion Principal (DIP)

- High level module should not depend on low level model, both should depend on abstraction 
- Dependency Inversion, Dependency injection and Inversion of Control are combined to perform DIP 

## Other best practices

- Constant refactoring 
- Design patterns 
- Unit testing (TDD, BDD) 