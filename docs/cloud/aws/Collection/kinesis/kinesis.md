# Kinesis

1. [Kinesis Streams](#kinesis)
2. [Kinesis Data Firehose (KDF)](#firehose)
3. [Kinesis Data Streams vs Firehose](#kinesisvsfirehose)

## 1. Kinesis Streams

**Goal:** low latency streaming ingest at scale

- Streams are divided in ordered Shards / Partitons
- Data retention is 24 hours by default, can go up to 7 days
- Ability to repocess / replay data
- Multiple applications can consume the same stream
- Real-time processing with scale of throughput
- Once data is insereted in Kinesis, is can't be deleted (immutablity)

### Kinesis Streams Shards

- One stream is made of one or multiple shards
- Billing is per shard provisioned, can have as shards as we want
- Batching available or per message calls
- Number of shards can evolve over time (reshard, merge)
- **Record are not to be ordered globally they'll be ordered per shard**

!["records"](/img/cloud/aws/kinesis_record.png)

### Limits

- **Producer**
  - 1 MB/s or 1000 messages/s at write PER SHARD
  - **ProvisionedThroughputException** otherwise
- **Consumer**
  - 2 MB/s at read PER SHARD accross all consumers
  - 5 API calls per second PER SHARD across all consumers
- **Consumer Enhanced Fan-Out**
  - 2 MB/s at read PER SHARD, PER ENHANCED CONSUMER
  - No API calls need (push model)
- **Data Retention**
  - 24 hours data retention by default
  - Can be extended to 7 days

## 2. Kinesis Data Firehose (KDF)

- **Goal:** load into S3, Redshift, ELK and Splunk

- Fully Managed Service, no administration
- ***Near Real Time*** 60 seconds latency mim for non full batches
- Load data into Readshift / Amazon S3 / ElasticSearch / Splunk
- Automtic scaling
- Supports many data formats
- Data Conversions from JSON to Parquet / ORC (Only for S3)
- Data Transformationi through AWS Lambda (ex: CSV => JSON)
- Support compression when target is **S3** (GZIP, ZIP and SNAPPY)
- Only GZIP is the data is further loaded into Redshift
- Pay for the amount of data going through Firehose
- Spark / KCL do not read from KDF
- **Write to KDF**
    - SDK
    - Kinesis Producer Library (KPL)
    - Kinesis Agent
    - Kinesis Data Streams (KDS)
    - CloudWatch Logs & Events
    - IoT rules action

!["read"](/img/cloud/aws/kdf_read_write.PNG)

* Firehose Buffer Size
    * Firehose accumulates records in a buffer
    * The buffer is flushed based on time and size rules
    * **Buffer Size (ex: 32MB):** if size is reached, it's flushed
    * **Buffer Time (ex: 2 minutes):** if that time is reached, it's flushed
    * Firehose can automatically increase the buffer size to increase throughput
    * High throughput => Buffer Size will be hit : usually we flush based on size
    * Low throughput => Buffer Time be hit : usually we flush on time  

## 3. Kinesis Data Streams vs Firehose

* **Streams**
    * Going to write custom code (producer / consumer)
    * Real time (~ 200 ms latency for class, ~ 70 ms latency for enhanced fan-out)
    * Must manage scaling (shard spliting / merging)
    * Data storage for 1 to 7 days , replay capability, mutli consumers
    * Use with **Lambda** to insert data in real-time to ElasticSearch (for example)
* **Firehose**
    * Fully managed, send to S3, Splunk, Redshift, ElasticSearch
    * Serveless data transformations with Lambda
    * Near real time **(lowest buffer time is 1 minute)**
    * Autmated Scaling
    * No data storage

* Install Kinesis Agent
```sudo yum install -y aws-kinesis-agent```
