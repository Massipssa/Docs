# Athena

- Is serverless to query **S3** using SQL
- Uses SQL language to query files (Build on top of **Apache Presto**)
- It's schema on read
- Accepts format:
  - CSV
  - Json
  - Parquet (columnar, splittable)
  - ORC (columnar, splittable)
  - Avro (columnar, splittable)
  - XML
- Princing: fixe amount per TB of data scanned 
- Structured, semi-structured an unstructured data
- Uses cases: BI, analytics, reporting, query logs, Ad-hoc queries 
- Athena detect automatically the tables from **Glue,** and it creates queryable table

## Performance 

- **Use columnar** data for cost-savings (less scan)
  - Apache Parquet or ORC is recommended
  - Use Glue to convert data to Parquet or ORC 
- **Compress data** for smaller retrievals (bzip2, gzip, lz4, snappy, zlip, zstd, ...)
- **Partition datasets** in S3 for easy querying on virtual columns
- **Use larger files** ( > 128 MB) to minimize overhead 

## Costs

- Pay-as-you-go 
  - $5 per TB scanned
    - **Successful or cancelled** queries count, **failed** queries do not
    - No charge for DDL (Create/ Alter, Drop, ...)
  - Save money by using columnar formats
    - ORC, Parquet
    - Save 30-90% and get better performance
    - Good partitioning (Less query CPU)
  - Glue and S3 have their own charges

## Federated Query 
- Query data anywhere (S3 ou on-premise)
- Use Data Source Connectors thar run on AWS Lambda to run Federated Queries
  
## Security

- Access control
  - IAM, ACLs, S3 bucket policies
  - AmazonAthenFullAcces/
- Encrypt .... ???
- Cross-acount in S3 bucket policy possible
- Transport Layer Security (TLS) encrypts in-transit (between Athena and S3)

## Anti-Pattern

- Highly formatted reports / visualization => That's what **QuickSight** is for
- ETL (not suitable for ETL actions) => use Gue instead
