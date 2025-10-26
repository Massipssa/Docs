## Data forms
- test
- stream
- audio
- video
- metadata

## Data can be
- Structured (Microsoft SQL Server, Azure SQL Databases, Azure Data Warehouse)
  - Data have a schema
  - Schema defined at design time 
  - React slowly to changes
- Unstructured (Azure Blob Storage, Cosmos DB, HDI) 
  - each element can have its own schema at query time (binary, audio and image file)
  - Key value, document, graph and column database
- Aggregated

## Data engineer must maintain system that are
- Accurate 
- Highly secured
- Constantly available

## On-premise
- Infra 
- Licence (per sever or per CAL "client Access Licence")
- Maintenance
- Scalability
- Availability
- Support 
- TCO total cost of ownership (TCO) describes the final cost of owning a given technology.

## On-Cloud
- LCID (langauge code identifier) 
- lift anf shift 

## ETL vs ELT 

## Azure IoT Hub
- Is the cloud gateway that connects IoT devices. IoT hubs gather data to drive business insights and automation

## Azure Event Hubs 
- Provides big-data streaming services. 

## Azure Storage
- Types 
  - Blob 
  - Files
  - Queue 
  - Table
- Provides 
  - API 
  - SDKs in multiple languages 
  - PS and azure cli 
- Support ACL and POSIX 
- All data writen to azure storage is encrypted by using either Microsoft or customer-managed keys
- Can be accessed via keys or shared access signature

## Cosmos DB
- Globally dis
- Multimodal 
- When to use:
  - Need NoSQL for supported API model 
  - Planet disb
  - 99,999 resp
  - response in 10 ms if correctly provisioned 
- Stored Procedure, triggers and UDFs can be added
- Js API can be used
- Security
  - Support encryption, IP firewall configurations, and access from virtual networks
  - Data is encrypted automatically
  - User authentication is based tokens 
  - Azure Active Directory provides role-based security

## Azure SQL Database
- Structured data
- Support also unstructured like spatial and xml
- Is PaaS
- Provides OLTP than can scale on demand
- When to use
    - Scale up and scale down needed
    - Take advantage of security and available features
    - Easy to maintain than on-premise server (avoid the risks of capital expenditures)
- How to ingest and process
    - Using SDKs of multiple languages like Java, python,..
    - With T-SQL 
    - From Azure Data Factory

## AzCopy 
- Can copy 1TB
- Splits files than executed 200 GB

## Azure Purview


- source, ingest, prepare, analyze, and consume
