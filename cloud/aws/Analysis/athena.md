# Athena

- To query **S3** using SQL
- Build on top of **Apache Presto**
- Is serverless
- It's schema on read
- Accepts format:
    - CSV
    - Json
    - Parquet (columnar, splittable)
    - ORC (columnar, splittable)
    - Avro (columnar, splittable)
    - XML
- Structured, semi-structured an unstructured data
- Ad-hoc queries 
- Athena detect automatically the tables from **Glue,** and it creates queryable table

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

## Security

- Access control
  - IAM, ACLs, S3 bucket policies
  - AmazonAthenFullAcces/
- Encrypt .... ???
- Cross-acount in S3 bucket policy possible
- Transport Layer Security (TLS) encrypts in-transit (between Athena and S3)

## Anti-Pattern

- Highly formatted reports / visualization => That's whet **QuickSight** is for
- ETL (not suitable for ETL actions) => use Gue instead