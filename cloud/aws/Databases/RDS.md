# Relational Database Service (RDS)

- SQL Server, Mysql, Postgres, Oracle, MariaDB, Aurora 
- Create relational databases
- Instance for prod, dev/test and free tier 

## Multi-AZ

- An exact copy of your  database in another AZ 
- Used for disaster recovery 
- In the event of a failure, RDS will automatically fail over to the standby instance

## Read replicas

- Read-only copy of primary database 
- Great for read-heavy workloads and takes the load off your primary database
- Can be cross-AZ 
- Can be cross-region 
- Can be promoted to be their own databases
- Require automatic backup
- Used to boost performance
- Can have up to 5 replicas of a database
- Each Read Replicas will have its own DNS Endpoint 

## Encryption 

- You can turn on encryption at-rest for all RDS engines 
- It'll also encrypt the automated backups, snapshots, and read replicas

## Backups 

- Automated backup 
  - Retention period between 1 and 35 days 
  - Stores transaction logs throughout the day 
  - They are enabled by default 
  - All data is stored inside S3 
  - There is no additional charge for buckup storage
  - Storage I/O may be suspended during backup 
- Manual Snapshots 
  - Taken manually by the user 
  - Backups persist even if you delete the original RDS instance

## Scaling 

- Vertical scaling 
- Scaling storage 
- Read replicas 
- Aurora serverless 

## RDS Proxy 

- Middleman between you and your RDS
- Handles all network traffic including: 
  - Establishing, maintaining and terminating connections 
- Reduces DB workload by requiring fewer connections
- Simplifies application logic 
- Can be used with Postgres, MySQL or Aurora 