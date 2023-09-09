# Azure Synapse Analytics
- Brings together data warehousing and bigdata analytics
- SQL Pools
  - Uses MMP to query and run petabytes of data
  - Could have **dedicated** resources or **serverless**
- Data Movement Service (DMS) coordinates and transports data between compute nodes as necessary
- Supports three types of distributed tables: 
  - Hash
  - Round-robin
  - Replicated
- Linked services
  - Create links to external resources
- PolyBase 
- Security
    - Supports SQL Server authentication and Azure Active Directory
    - Can set up multifactor authentication
    - Supports security at the level of both columns and rows

- Spark pools
  - Can be run using notebook
  - Job definition: using jars 

- Dataflow
- Pipelines


## Synapse Analytics SQL 
A distributed SQL query system and it offers two runtime environments
- Dedicated SQL pool 
- Serverless SQL pool 

### Objects
- External Data source 
- External files 
- External tables 

