# Tuning

## In Driver

- Dynamic Executor Allocation
    - Enables Spark jobs to add and remove executors on the fly
    - Get how much resource you need not more 
    - Good for multi-tenant environment

## In Executor

1. Important ....

- **spark.executor.cores**: the number of virtual cores to assign for each executor
   - The number of threads per executor
   - Large number of virtual cores leads to low number of executors => reduce the parallelism 
   - Low number of virtual cores leads to high number of executors => large amount of I/O operations
   - Recommended number based of benchmarks is: ``spark.executor.cores=5``
    
- **spark.executor.memory:** amount of memory per executor
    - Assign one virtual core to Hadoop daemons
        
        ``nb of executor per instance = (nb of total virtual cores - 1) / spark.executor.cores``
    
    - Assign **1 GB** for Hadoop daemons
    
        ``Total executor memory = (total RAM - 1) / nb of executor per instance``

- **spark.executor.instances (--num-executor):**
    - The number of tasks that can be run in parallel 


2. Off-Heap
    - **spark.memory.offHeap.enabled** => true
    - **spark.memory.offHeap.size** => e.g : 2g
    
3. Garbage collector

4. Eliminating disk I/O bottleneck
    - Disk access is 10-100K time slower than memory
    - **spark.shuffle.file.buffer**
    - **spark.io.compression.lz4.blockSize** This will reduce the size of shuffles  
        - Default is 32k and is sub-optimal
        - 512k gives the best performance


## Cache / persist
- Use cache or persist when small data is accessed frequently (like lookup table) 
  or using iterative algorithm.
- Don't forget to un-cache or un-persist otherwise you'll see some spill to disk which will
  increase pressure on GC.

## Coalesce / repartition
- Use coalesce instead of repartition when you want to reduce partitions size. It'll avoid
  shuffling the data. 

## Broadcast join

## Serialization

- Convert object to stream of bytes or vice versa
- Help when
    - Saving data to disk
    - Send data over network
- Happen when things are shuffled around
- Helps to
    - Decrease memory usage
    - Reduce network bottleneck
    - Enhance performance tuning

- Two types of serialization
    - Java serialization
    - Kryo serialization
    
- Kryo serialization is exceptionally 10x faster and more compact than Java serialization
    
    - **spark.serializer => org.apache.spark.serializer.KryoSerializer**
    - **spark.kryoserializer.buffer.mb => 24**


## Partition tuning 
- More issue    
    - Too few partitions
        - Less concurrency
        - More susceptible to data skew
        - Increased memory pressure for groupBy, reduceBy, ...
    - Too many partitions
        - It'll take many times to schedule task
    - Need ***reasonable number*** of partition
- **Lower bound:**  At least ~3x number of cores in the cluster
- **Upper bound:** Ensure tasks take at least 100ms


## Shuffle

- **spark.shuffle.compress:** whether to compress map output files (true by default).
- **spark.shuffle.spill.compress:** wheter to compress data spilled during the shuffles (true by default).
- **spark.shuffle.manager:** specify spark shuffle algorithm
    - Hash
    - Sort
    - Tungsten
    
## Data locality 


### Example

- 6 nodes (***number of nodes***) 
- 16 cores per node (***number of cores per node***)
  - One core should be reserved to Hadoop process, so ``number of cores per node = 15``
- 64 GB RAM per node (***memory per node***)
- The optimal value is 5 vcores per executor (***number of cores per executor***, --executor-cores)

    ```
   number of executor per node = number of cores per node / number of vcores per executor 
                                  = 15 / 5 
                                  = 3                           
   ```

- The total number of executors (--num-executors)
    - One executor (JVM process) should be left to yarn (Application Master).
    
   ```
   total number of executors = (number of nodes * number of executors per node) - 1 
                                  = (6 * 3) - 1 
                                  = 17                           
   ```
- Memory per executor
  
   ```
   initial memory per executor = memory per node / number of executor per node 
                                  = 64 / 3
                                  = 21 GB                           
   ```
  - This isn't the final memory we should allocate small overhead memory needed by yarn process 
    
    ```
    overhead memory = max(384, 0.07 * spark.executor.memory)
                    = max(384, 0.07 * 21)
                    = 1.47
    ```
    
    ``` 
    memory per executor = initial memory per executor -  overhead memory
                            = 21 - 1.47
                            ~= 19 GB
    ```
    
    
### Links 
- [Link-1](https://aws.amazon.com/fr/blogs/big-data/best-practices-for-successfully-managing-memory-for-apache-spark-applications-on-amazon-emr/) 
