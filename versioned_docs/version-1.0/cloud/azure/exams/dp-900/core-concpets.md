# Core concepts

## Data format
- Structured (relational db)
- Semi-structured (json, csv, ...)
- Unstructured (images, videos, audios, binary files, ...)

## Databases
- Relational
- NoSql
  - Key-value
  - Document: a specific form of key-value 
  - Column oriented: uses column family to group a set of columns
  - Graph: store entities as nodes and links to define relationship between them  

## Transactional processing 
- Online Transactional Processing (OLTP)
  -  Uses databases optimized for read and write
  -  Require system with ACID 
  -  Used to support live application called (LOB: line of business)

## Analytic processing 

- Read only 
- Rely on vast volumes of historical data or system metrics  
- **Data warehouses** are an established way to store data in a relational schema that is optimized for read operations – primarily queries to support reporting and data visualization. The data warehouse schema may require some denormalization of data in an OLTP data source (introducing some duplication to make queries perform faster) (Source Azure)
- online analytical processing (OLAP)

# Data roles and services

## Roles 
- Database administrator
- Data engineer
- Data Analyst

## Services 
- Azul SQL 
  - Azure SQL Database: fully managed database (PaaS)
  - Azure SQL Managed instance: a hosted instance of Sql Server 
  - Azure Database VM: a virtual machine with installed Sql server 
- Open source databases 
  - Mysql 
  - MariaDB: optimize version of Mysql and compatible with Oracle 
  - Postgrsql: hybrid relational-object database 
- Azure cosmos DB 
  - Alos to store data in:
    - Document format (json)
    - Graph
    - Key-value pair 
    - Column families
  - Compatible Apis 
- Azure Storage 
  - Blob container 
  - Files share
  - Table: key-value

- Data factory
  - Create and schedule data pipeline
  - Used to create ETL
  - Can interact with other storage type
- Azure Synapse Analytics 
- HInsight 
- Databricks 
- Azure Stream Analytics
- Azure PureView
- PowerBI
