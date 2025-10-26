# DynamoDB

- Fully managed service
- Is made of tables (no need to create databases)
- Each table must have a primary key (decided at creation time)
- Each table can have an infinite items (rows)
- Each item have **attributes** (can be added over time, can be null)
- Maximum size of item is **400KB**
- Supported data types:
  - **Scalar types:** String, Number, Binary, Boolean, Null
  - **Document Types:** List, Map
  - **Set Types:** String set, Number Set, Binary Set

## Primary Keys

- **Option 1**: Partition key only (Hash)
  - Partition Key must be unique for each item
  - Partition Key must be **diverse** so that the data is distributed

- **Option 2: Partition Key + Sort Key**
  - The combination must be unique
  - Data is grouped by partition key
  - Sort == range key

## Anti-Pattern

- Pre-written application to traditional relational database => use RDS instead
- Joins or complex transactions
- Binary Large Object (BLOB) => Store in S3 & metadata in DynamoDB

- When you create table in DynamoDB you must provide:

1. **Read Capacity Units:** throughput for reads
    - How we compute it ?
    - **Once write capacity unit:** represents one write per second for an item up to 1KB in size

- **Write Capacity Units:** throughput for writes

## Partitions

- You start with one partition
- Each partition:
  - Max of ***3000 RCU / 1000 WCU***
  - Max of ***10GB**

- To compute the number of partitions:
  - By capacity => ```(TOTAL RCU / 3000) + (TOTAL WCU / 1000)```
    - By size => ```(TOTAL table size / 10 BG)```
  - Total partitions = ```CEILING(MAX(Capacity, Size))```

- **WCU and RCU are spread evenly between partitions**

## Auto Scaling
