## Shuflle

* Redistributes data among partitions
* Hash keys into buckets

* Data no longer stay in memory

* Involves:
    * Data partition : which may involves very expensive data sorting works
    * Data ser/deser: to enable data been transfer through network or accross process
    * Data compression: to reduce IO bandwidth
    * DISK IO; probably multiple times on single data blocl
        * e.g Shuffle Spill, Mergde combine

* Tricks
    * Avoid when it's possible
    * Use partial aggregation to reduces data movement ?

## Join


1. **Shuffle join:**  ***Big-table to Big-table*** => Shuffle join (Each node will talk to another node to get join keys)  -- all-to-all communication

2. **Broadcast join:**
    - With **Big-table to Small-table** => Use broadcast join on the small table. Place a small  table in each executor -- per node computaion strategy
    - ```spark.sql.autoBroadcastJoinThreshold``` is used to determine the size

* **Little-to-little table** => let Spark to decide how to join them

3. **Sort join**

4. **Bucket join**