# Relational Database Service (RDS)

- SQL Server, Mysql, Postgres, Oracle, MariaDB, Aurora 
- Create relational databases
- Instance for prod, dev/test and free tier 

## Multi-AZ

- An exact copy of your production database in another AZ 
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