# Shuffle and Join

## Shuffle

- Redistributes data among partitions
- Hash keys into buckets
- Data no longer stay in memory
- Involves:
  - **Data partition:** which may involves very expensive data sorting works
  - **Data ser/des:** to enable data been transfer through network or across process
  - **Data compression:** to reduce IO bandwidth
  - **DISK IO:** probably multiple times on single data bloc
    - e.g Shuffle Spill, Merge combine

- Tricks
  - Avoid when it's possible
  - Use partial aggregation to reduces data movement ?

## Join

- *Big-table to Big-table*
  - **Shuffle join:** => Shuffle join (Each node will talk to another node to get join keys)
  - It'll induce  ***all-to-all*** communication

- *Big-table to Small-table*
  - **Broadcast join**
    - Use broadcast join on the small table.
    - Place a small table in each executor
    - Induce per node computation strategy
    - ```spark.sql.autoBroadcastJoinThreshold``` is used to determine the size

- **Little-to-little table**
  - Let Spark to decide how to join them

1. **Sort join**

2. **Bucket join**
