- Spark architecture
- Transformation vs action 
  - Transformation always returns an RDD (wide and large --> add schema)
  - Action    
- Why Spark ?
  - In-memory Computation (100x times faster than MR in memory, 10x faster than on disk)
  - Lazy Evaluation   
- Execution modes 
- Deploy modes
- How spark reads config ?
  - Main
  
  ```SparkSession spark = SparkSession
        .master("local")
        .config("key1", "value1")
        ...
        .getOrCreate() // Important ? 
  ```
  - Spark-submit 
  - Default config 
- Spark memory types ? 
- Notion of APP -> Stage -> tasks (vcore)


## To present later
  - Spark plans
