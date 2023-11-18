# Relational Database Service (RDS)

- It allows to create and manage relational databases
- It Supports: 
  - SQL Server
  - Mysql
  - Postgres
  - Oracle
  - MariaDB
  - Aurora 
- Why to use RDS:
  - Automated provisioning and OS patching
  - Continuous backups and restore to specific timestamp (Point in Time Restore)
  - Monitoring dashboards 
  - Read replicas for improved read performance
  - Multi AZ setup for Disaster Recovery 
  - Maintenance windows for upgrades 
  - Scaling capability (Vertical and Horizontal)
  - Storage backed by EBS (gp2 or io1)
- Instance for prod, dev/test and free tier 

## Storage Auto Scaling 

- Helps to increase the storage on the RDS instance 
- When RDS detects you are running out of free database storage, it scales automatically
- Need ti set Maximum Storage Threshold (maximum limit for DB storage)
- Automatically modify storage if: 
  - Free storage is less than 10 %
  - Low-storage lasts at least 5 minutes 
  - 6 hours have passed since the last modification

## Multi-AZ

- An exact copy of your  database in another AZ 
- Used for disaster recovery 
- In the event of a failure, RDS will automatically fail over to the standby instance

## Read replicas

- Read-only copy of primary database 
- Great for read-heavy workloads and takes the load off your primary database
- Can be within AZ, cross-AZ or Cross-region
- Can be promoted to be their own databases
- Require automatic backup
- Used to boost performance
- Can have up to 5 replicas of a database
- Each Read Replicas will have its own DNS Endpoint 

## RDS Custom 

- Supported only by Oracle and SQL Server

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

## RDS & Aurora Security

- At-rest encryption
  - Database master and replicas encryption using AWS KMS must be defined as launch time 
  - If the master is not encrypted, the read replicas cannot be encrypted 
  - To encrypt an un-encrypted database, go through a DB Snapshot and restore as encrypted 
- In-flight encryption: TLS-ready by default, use the AWS TLS root certificate client-side 
- IAM Authentication: IAM roles to connect to your database (instead of username/pwd)
- Security Groups: Control Network access to your RDS / Aurora DB 
- No SSH available except on RDS Custom
- Audit Logs can be enabled and sent to CloudWatch Logs for longer retention

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
- Enforce IAM Authentication for DB, and securely store credentials in AWS Secrets Manager
- Can be used with Postgres, MySQL or Aurora 
- Serverless, autoscaling, highly available (multi-AZ)

