- Spark architecture
- Transformation vs action 
  - Transformation always returns an RDD (wide and large --> add schema)
  - Action 
- Execution modes 
- Deploy modes
 
- Why Spark ?
  - In-memory Computation (100x times faster than MR in memory, 10x faster than on disk) **Remark DS**
  - Resilient Distributed Datasets (RDD)
    - Immuatable (Why ?) **Because of fact that data is distruted + servers in data recovery**
    - Can be cached or persisted   
  - Lazy Evaluation

- How data is partitionned ?
  - Huge amount of data can't fit in one single node memory
  - Leads to minimize IO (serialization and deserialization)
  - Spark uses the princpe of data locality (read date from the nodes that are close) **look in detail** 
  - Creates a partition of size 64MB in HDFS
    - The partition is by itself can be partited by HDFS (in hdfs way) (Imagine it as a file that you write and every file writen to HDFS is partitionned)
- How handales data recovery **Add an image**
  - Node crash (no heartbeat are received from the node) ??
  - Lineage graph (execution plan) -->  DAG
    - Applies the same execution plan in all nodes leads to recover the data
  - Task fails ?
    - Retry 
    - It no ==> assign to new executor
  
- How spark reads config ? Order is important 
  - Main
  
  ```java
  SparkSession spark = SparkSession
        .master("local")
        .config("key1", "value1")
        ...
        .getOrCreate() // Important ? 
  ```
  - Spark-submit 
  - Default config 
- Spark memory types ? **Add image**
- Notion of APP -> Stage -> tasks (vcore)


## To present later
  - Spark plans
