## Java questions

- HashSet vs TreeSet
- The role of Serializable interface
- String vs StringBuilder 


## Spark common errors 
- Task not serializable

## SQL vs NOSQL
- Normalize data, Denormalize
- ACID, CAP
- SQL: 
	- Uses stored procedure
	- Referential integrity: takes care of enforcing relationships between various table schemas
- NOSQL
    - Generally no support for transactions or secondary indexes and often have no fixed schema
    
### How to choose storage tool

- **Data model**
    - Key/value
    - Semi-structured
    - Column-oriented
    - Document-oriented
- **Storage model**
    - In-memory 
    - Persistent
- **Consistency model**
    - Strictly
    - Eventually consistent
- **Physical model**    
    - Distributed
    - Single machine
- **Read/write performance**
    - Read / write equals ?  equal ?
    - Does it support range scans or is it better suited doing random reads
- **Secondary indexes**
    - Does it support secondary indexes ?
    - How strong it supports secondary indexes

- **Failure handling**
    - How it handles servers failure ?
    - It is able to continue operating ?
    - How it backups data in server replacement ? 
    - How it performs server decommissioning
    
- **Compression**
    - Is the compression method pluggable? 
    - What types are available?

- **Load balancing**
    - Does it accept load balancing 
    - How it performs load balancing in case of high throughput
- **Atomic read-modify-write**

- **Locking, waits and dead-locks**
  - Can it be free for wait and therefore deadlocks ?
- **Security**
    - ??    

## Python

### Most used module in python

- os
- sys
- datetime
- requests
- signal
- pandas
- shutil: copy files, rm, ....
- inspect: inspect objects at runtime (reflexion in java) 

### Class method vs static method


## Runtime Errors
- NotImplementedError





## To learn 
- Code smell
- Websocket
- snakebite