# BigQuery

- Fully managed service
- Deals with
  - Storage:
    - Data is stored in structued table
    - Replicated, distributed storage
  - Ingestion
  - Quering
- Supports ***SQL***
- Near real-time query analysis
- Accept batch and streaming
- Can be used for storage and analysis
- Replicated and durable
- Is columnar

## IAM

- Control can be done by project, dataset and view
- Has predifined roles ...
- Sharding dataset
- View can be used to restrict access to some data
- Supports premitives roles for Project Level access

## Cache

- Enabled by default
- Are per user
- No charge for queries exectued from the cache

## Partition

- Ingestion-time partitioned
- Partition by specific timestamp/date column

## UDF

- Combine JaveScript with SQL
- Allow more complexe operations like loops, combinaison, ...

## Princing

- Charged fro: Storage, Quering and Streaming insert
- No charge for Batch Loading
- **Flat rate ??**

## Import and export data to BigQuery

- Load
    - Command
        - ```bq load names.baby_names gs://(YOUR_BUCKET)/names/yob*.txt Name:STRING,Gender:STRING,Number:INTEGER```
- Export
    - BigQuery <=> BigQuery
    - Table's data can only be exported to **GCS** with one of this format csv, json, avro
    - To get data from **Dataproc**, a connector is install by default in Dataporc and the data will be exported to GSP then to bucket will be read from BigQuey
    - Can only export up to 1 GB
    - Command
        - ```bq extract 'projectid:dataset:table' gc://bucket_name/folder/object_name```

## Monitor & Logging

- Monitor allows to visualize:
    - Metrics (alter on metric)
    - Performance
    - Resource capacity/usage (Slots)
- Logging:
    - Who is doing what (show actions history)

- What does colors mean in query details ?

## bq tool

- Create dataset
    ```bq  mk --dataset ds_name```

- Select from table
    ```bq query --use_legacy_sql=false 'select * from ds_result.top_qsts' ```
