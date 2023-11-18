# Aurora 

- Amazon propriety database 
- MySql and Postgresql compatible database engine
- 5x than Mysql and 3x than Postgresql in performance 
- Can have up to 15 replicas and the replication process is faster than MySQL

 
## Basics

- Start with 10 GB, scale with 10GB-increments to 128 TB (storage auto-scaling)
- Compute resources can scale uo to 96 vCPUs and 768 GB of memory
- 2 copies of data are contained in each AZ, with a minimum of 3 AZ. 6 copies of your data


## Advanced 

- Replicas Auto-scaling: add reader replicas 
- Custom Endpoints: define a subset of Aurora instances as a Custom Endpoint and the Reader Endpoint is generally not
  used after defining Custom Endpoint
- Serverless 
  - Automated database and auto-scaling on actual usage 
  - Good for infrequent intermittent or unpredictable workloads
  - No capacity planning needed 
  - Pay per second, can be more cost-effective 
- Aurora Multi-Master 
  - In case you cant continuous write availability for the writer nodes 
  - Every node does R/W vs promoting as Read Replica as the new master 
- Global Aurora
  - Aurora Cross Region Read Replicas 
    - Useful for disaster recovery 
    - Simple to put in place  
  - Aurora Global Database (Recommended)
    - 1 Primary Region (Read / Write)
    - Up to 5 secondary (read-only) regions, replication lag is less than 1 second 
    - Up to 16 Read Replicas per secondary region 
    - Promoting another region  (for disaster recovery) has an RTO of < 1 minute 
    - Typical cross-region replication takes less than 1 second 