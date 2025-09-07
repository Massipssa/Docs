# Multi-threading

* Deux sortes de thread
    * **Lourd (processus):** lancé par le maain
    * **Lègres:**:lancés en parallèless, on retrouve deux types
        * **System thread**: sont ceux lancés par la JVM (ex: GC)
        * **Defined thread:** sont ceux définis par le développeur, sont gérè par **ExecutorService** in java
* volatile: 
    * Do not cache the variable
    * Always read it from the main memory