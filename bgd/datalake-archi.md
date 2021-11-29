## Best practice
- Use Event-Sourcing to facilitate backups (store now, analyze later)
- Layer data based on user’s skills (data analytic, engendering, ...)
- Keep the Datalake open (avoiding vendor lock-in, or overbalance on a single tool or database)
- Plan for performance
- See the [link](https://www.upsolver.com/blog/four-principles-data-lake-architecture)

## Architecture
**- Datalake**
 - Pros: 
  - Store different type of data (structued, semi and non-strcutrued)
  - Allows flexbily
 - Cons: 
    - Mutiples issues of data quality   
**- Lambda**

## Example of data ingestion in Uber
- Decouple storage from query layer, each can be scaled independently
- Two dataset types
    - Append-only
    - Append-plus-update
    
- Challenges
    - Not read the hole dataset
    - Spread across multiple files within partitions to leverage high parallelism during writes and in case
    of files updates, limiting write footprint only to the files containing these updates
    - For efficient updates: lookup tool (<u>lookup table</u>) for location of the data with the Big data platform
![update_insert](screenshots/datalake/update_insert.png)
      
    - The indexing system that maybe used **HBase** or **Cassandra** 
    - Hbase vs Cassandra
      - HBase permits consistency on reads and writes. No need to tweak consistency parameter as is done in cassandra
      - HBase provides automatic rebalancing of tables within a cluster

![indexing_system](screenshots/datalake/indexing_system.png)

- See the [link](https://eng.uber.com/data-partitioning-global-indexing/)
