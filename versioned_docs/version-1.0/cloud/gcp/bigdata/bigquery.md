# BigQuery

- Fully managed serverless data warehouse
- Provide storage and analytics at the same time
- Deals with
  - Storage:
    - Data is stored in structured table
    - Replicated, distributed storage
  - Ingestion
  - Querying
- Pay-as-you go pricing model
- Encryption at the rest by default
- Supports ***SQL***
- Near real-time query analysis
- Accept batch and streaming
- Can be used for storage and analysis
- Tables are immutable are optimized for reading and appending data and not optimized for updating
- Replicated and durable
- Is columnar
- Built-in machine learning models
- Supports repeated columns and nested schema
- Supports view and materialized views
- Policy Tag used to hide or obfuscate a column

## Queries types

- Native tables
- Federated queries
  - Bq create tmp table to query the data. It's retained for 24h. so if you run the exact same query again, and if the results would not be different, then BigQuery will simply return a pointer to the cached results  

## IAM

- Control can be done by project, dataset, tables, views or columns
- Has predefined roles ...
- Sharding dataset
- View can be used to restrict access to some data
- Supports primitives roles for Project Level access

## Cache

- Enabled by default
- Are per user
- No charge for queries executed from the cache

## Partition

- Types
  - Ingestion-time partitioned
  - Partition by specific timestamp/date column
  - Range partition (integer-type colum)
- Best practice is to ensure that partition column is always invoked in querying

## Clustering

- ??

## UDF

- Combine JavaScript with SQL
- Allow more complex operations like loops, combination, ...

## Princing

- Charged for: Storage, Querying and Streaming insert
- No charge for Batch Loading
- **Flat rate ??**

## Import and export data to BigQuery

- Load
  - Command

  ```bq load names.baby_names gs://(YOUR_BUCKET)/names/yob*.txt Name:STRING,Gender:STRING,Number:INTEGER```

- Export
  - BigQuery ``<=>`` BigQuery
  - Table's data can only be exported to **GCS** with one of this format csv, json, avro
  - To get data from **Dataproc**, a connector is installed by default in Dataproc and the data will be exported to GSP then to bucket will be read from BigQuey
  - Can only export up to 1 GB
  - Command
    - ```bq extract 'projectid:dataset:table' gc://bucket_name/folder/object_name```

## Monitor & Logging

- Monitor allows to visualize:
  - Metrics (alter on metric)
  - Performance
  - Resource capacity/usage (Slots)
- Logging:
  Who is doing what (show actions history)

- What does colors mean in query details ?

## bq tool

- Create dataset
  
```bq  mk --dataset ds_name```

- Select from table
  
```bq query --use_legacy_sql=false 'select * from ds_result.top_qsts' ```

## Bigquery ML

- ML model in two steps:
  - Build the model
  - Train the model
- Manually or automatically control hyperparameters
- Supports
  - Supervised
  - Unsupervised
- Steps
  - Extract, transform and load data into Bigquery
  - Select and preprocess features
  - Create the model inside Bigquery
  - Evaluate the performance of evaluated trained model
  - Use the model to make predictions
