
## Functional Programming

- No state
- Pure function
  - Given the same inputs, always returns the same output, and
  - Has no side-effects
- No side effects
- Higher Order Function
  - The function one takes or more functions as parameter
  - The function returns another function as result
- Immutable data
- Referential transparency

    
## Multi-threading

* Deux sortes de thread
    * **Lourd (processus):** lancé par le maain
    * **Lègres:**:lancés en parallèless, on retrouve deux types
        * **System thread**: sont ceux lancés par la JVM (ex: GC)
        * **Defined thread:** sont ceux définis par le développeur, sont gérè par **ExecutorService** in java
* volatile: 
    * Do not cache the variable
    * Always read it from the main memory