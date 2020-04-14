# Tunning

## In Dirver

* Dynamic Executor Allocation:
    * Eanables Spark job to add and remove  executors on the fly
    * Get how much resource you need not more
    *Good for multi-tenant environment

## In Executor

1.
2. Off-Heap
    * **spark.memory.offHeap.enabled** => true
    * **spark.memory.offHeap.size** => e.g : 2g
3. Garbage collector
4. Elimintating disk I/O bottlneck
    * Disk access is 10-100K time slower than memory
    * **spark.shuffle.file.buffer**
    * **spark.io.compression.lz4.blockSize** This will reduce the size of shuffles  
        * Default is 32k and is sub-optimal
        * 512k gives the best performance

## Serialization

* Convert object to streams of bytes or vice versa
* Help when
    * Saving data to disk
    * Send data over network
* Happen when things are shuffled around
* Helps to
    * Decrease memory usage
    * Reduce network bottleneck
    * Enhance performance tuning

* Two types of serialization
    * Java serialization
    * Kryo serialization
* Kryo serialization is exceptionally 10x faster and more compact than Java serialization
    
    * **spark.serializer => org.apache.spark.serializer.KryoSerializer**
    * **spark.kryoserializer.buffer.mb => 24**


## Partiton tuning 
* More issue    
    * Too few partitons
        * Less concurrency
        * More suceptible to data skew
        * Increased memory pressure for groupBy, reduceBy, ...
    * Too many partiton
        * It'll take many time to schedule task
    * Need "reasonable number" of partition
* **Lower bound:**  At leaast ~2x number of cores in the cluster
* **Upper bound:** Ensure tasks take at least 100ms
