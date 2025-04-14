# Databricks 

- Data Science and Engineering
- Machine Learning
- SQL (workloads are only available in premium tier workspaces)

## Delta lake 
It brings to datalake the features bellow
- CRUD 
- ACID 
- Data versioning and time travel
- Support for batch and streaming data
- Standard formats and interoperability: uses parquet as format to store data

## Retrieve version 
- versionAsOf
- timestampAsOf

## SQL Warehouses 
The data is stored in files that are abstracted by Delta tables in a hive metastore, 
but from the perspective of the user or client application, the SQL Warehouse behaves like a relational database.
- Dashboards: can be scheduled the dashboard to refresh is data periodically, and notify subscribers by email
that new data is available.