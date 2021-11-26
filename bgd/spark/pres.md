## **Why Spark ?**
- In-memory Computation (100x times faster than MR in memory, 10x faster than on disk) **===> Remark DS**
- Resilient Distributed Datasets (RDD)
  - Immuatable (Why ?) **Because of fact that data is distruted + servers in data recovery**
  - Can be cached or persisted   
- Lazy Evaluation
 
## **Spark architecture**


## How can be executed a Spark App **Execution modes**
- Standalone (local) 
- Yarn
- Kubernetes
- Mesos

## Deploy modes
- Client 
- Cluster (main difference: owner of resources ??) 
  
## Transformation vs action
- Transformation always returns an RDD (wide and large --> add schema)
- Action 

## **How does Spark partition the data ?**  **===> add an image**
  - Huge amount of data can't fit in one single node memory
  - Leads to minimize IO (serialization and deserialization)
  - Spark uses the princpe of data locality (read date from the nodes that are close) **look in detail** 
  - Creates a partition of size 128 MB in HDFS
    - The partition itself can be partited by HDFS (in hdfs way) 
      -  Imagine it as a file that you write and every file writen to HDFS is partitionned
      -  Partiton of 256 MB => 2 blocks in HDFS (HDFS partition)
  - Having many partitions doesn't mean more performance
    - Partition <=> task, so, many partitions will the increase the execution time because it
      requires a lot of time for creating, scheduling and manging task by spark scheduler
    - A lot of partition leads a huge flow between driver and executor   
    - Empty partition takes time to compute 
  - A few number of partition
    - Idle nodes
    - Data skew issue  
  - Recommandation 2x or 3x number of vcores 
  - 100 ms to computes a partition **(benchmark have been done on machines with average capacities)**
  - Example:  file of 10KB in 20 partitions 
  
  ```java
    read.text("path/to/text.txt")
        .repartition(20)
  ```
  -  repartition() or coalesce(): partition data in memory 
  -  partitionBy(): partition data in disk
  
## Spark memory types ? **Add image**

## Notion of APP -> Stage -> tasks (vcore)
   
## How handales data recovery **==>Add an image**
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


## To present later
  - Spark plans
