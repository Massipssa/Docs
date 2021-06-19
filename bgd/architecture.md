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
  
## Steps to mount cluster
- Chose OS
- Select the FS to use with disk
	- ext3
	- ext4
	- XFS
