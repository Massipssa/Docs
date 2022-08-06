## Data forms
- test
- stream
- audio
- video
- metadata
-
## Data can be
- Structured (Microsoft SQL Server, Azure SQL Databases, Azure Data Warehouse):
  - Data have a schema
  - Scheam defined at design time 
  - React slowly to changes
- Unstructured (Azure Blob Storage, Cosmoms DB, HDI): 
  - each element can have its own shcema at query time (binary, audio and image file)
  - Key value, document, graph and column database
- Aggregated

## Data engineer must maintain system that are
- Accurate 
- Highly secured
- Constantly available

## On-premise
- Infra 
- Licence (per sever or per CAL "client Access Licence")
- Maintenace
- Scalability
- Availability
- Support 
- TCO total cost of ownership (TCO) describes the final cost of owning a given technology.

## On-cloude 
- LCID (langauge code identifier) 
- lift anf shift 

## ETL vs ELT 

## Azure IoT Hub

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
- All data writen to azure storage is crypted
- Can be accessed via keys or shared access signature

## Cosmos DB
- Globally dis
- Multimodel 
- When to use:
  - Need NoSQL for supported API model 
  - Planet disb
  - 99,999 resp
  - response in 10 ms if correctly provisioned 
- Stored Procedure, tirggers and UDFs can be added
- Js API can be used
- Security
  - Support encyption, IP firewall configurations, and access from virtual networks
  - Data is encrypted autmatically
  - User authication is based tokens 
  - Azure Active Directory provides role-based security

## Azure SQL Database
- Structrued data
- Support also unstructrued like spatial and xml
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
    
## Azure Synapse Analytics
- Brings toghter data warehousing and bigdata analytics
- SQL Pools uses MMP to query and run petabytes of data
- Data Movement Service (DMS) coordinates and transports data between compute nodes as necessary
- Supports three types of distributed tables: hash, round-robin and replicated
- PolyBase 
- Security
    - Supports SQL Server authentication and Azure Active Directory
    - Can set up multifactor authentication
    - Supports security at the level of both columns and rows

## AzCopy 
- Can copy 1TB
- Splits files than execeed 200 GB
	
