# Glue

- Fully managed ETL
- Table definition and ETL
- Glue crawler will extract partitions based on how your S3 data is organized
- We can use Glue metadata catalog as metastore for hive, inversely we can import hive metastore to Glue
- Runs on serverless **Spark** platform
- Encryption:
  - Server-side (at rest)
  - SSL (in transit)
- Can be event-driven **??**
- Can provision additional **DPU's** (data processing units) to increase performance of underlying Spark jobs **??**
- Errors reported to **CloudWatch**
- **Data Catalog:** metadata repository that can serve as drop-in replacement for hive metastore
- **Crawlers:** programs that run through data ton infer schemas and partitions
- Bookmarking ??

## Glue cost and anti-patterns

- Billed by the minute for crawler and ETL jobs
- First million objects stored and accesses are free for the Glue Data Catalog
- Development endpoints for developing ETL code charged by the minute **???**
- Anti-patterns:
  - Streaming data (Glus is batch oriented, minimum 5 minutes interval) => use for example Kinesis instead
  - Multiple ETL engines (if we'll use multiple engines, hive ...) => use EMR service instead
  - NoSQL databases (Glue objective is to work with Structured data)
  