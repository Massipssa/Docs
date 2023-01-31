## Data forms
- test
- stream
- audio
- video
- metadata

## Data can be
- Structured (Microsoft SQL Server, Azure SQL Databases, Azure Data Warehouse):
  - Data have a schema
  - Schema defined at design time 
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

##  Azure Stream Analytics
- To process streaming data and respond to data anomalies in real time
- For Internet of Things (IoT) monitoring, web logs, remote patient monitoring, and point of sale (POS) systems
- Stream Analytics handles security at the transport layer between the device and Azure IoT Hub

## AzCopy 
- Can copy 1TB
- Splits files than execeed 200 GB

## Azure Purview


- source, ingest, prepare, analyze, and consume