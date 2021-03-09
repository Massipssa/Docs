
## Functional Programming

* No state
* Pure function (dont depends on global variable)
* No side effects
* Higher Order Function
    * The function one takes or more functions as parameter
    * The function returns another function as result
    
## Multi-threading

* Deux sortes de thread
    * **Lourd (processus):** lancé par le maain
    * **Lègres:**:lancés en parallèless, on retrouve deux types
        * **System thread**: sont ceux lancés par la JVM (ex: GC)
        * **Defined thread:** sont ceux définis par le développeur, sont gérè par **ExecutorService** in java
* volatile: 
    * Do not cache the variable
    * Always read it from the main memory