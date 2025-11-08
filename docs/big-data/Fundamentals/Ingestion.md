# Data Ingestion

## Key concepts

### Syn and Async ingestion

### Synchronous Ingestion

- The donwstream process can't start until all data in the batch have been completly ingested. If any ingestion of transformation process fails, the entire process must be rereun.
- A --> B --> C
- A, B, and C directly dependent upon one another
- (A faills, B and C cannot start, if B fails the process C can't start)
- Common in ETL where data extracted from source must be transformed before being loaded into dat awarehouse

### Asynchronous Ingestion

With asynchronous ingestion, dependencies can now operate at the level of individual  events,  much  as  they  would  in  a  software  backend  built  from  microservices

### Serialization and Deserialization

- Serialization: encoding the data from a source and preparing data structures for transmission and intermediate storage stages.
- Deserialization: 

### Throughput and Scalability

Ingestion boteleck are common in practice. Data throughput and system scalabilty become critical as data volume grow and requirtments change.
Case where a database goes downn, and in backfill will your system be able to keep up with this sudden influx of backlogged data?
The system built-in buffering is  required  to  collect  events  during  rate  spikes  to  prevent  data  from  getting  lost
- Whenever possible uses managed service that handles the throughput scaling for you (can be accoplished manually but often isn't value-added and there's a good chance you'll miss something)

### Reliability and Durability

- Reliability: high uptime and proper failover for ingestion system
- Durability: data isn't lost or corrupted

Some system may not retain data if it's not properly ingested. Thare require you to build an apporperite level of redendancy and self-healing based on the impact and cost of losing data.
Evaluat the direct cost and indirect cost

### Payload

Is a dataset you're ingesting and it has many charactersitics

### Kind

It constists of type and format
  - Type: tabular, video, text
  - Foamrt: the way the data is expressed in bytes, names, and file extensions.

### Shape

Describes the dimensions

### Size

the number of bytes of the payload
  - Can be compressed 
  - Can be also split into chuncks

### Schema and data types

-  A schema  describes  the  fields  and  types  of  data within those fields
-  Schema changes occurs often in upstream system they need to be cathced, some examples
   -  Adding column 
   -  Renaming column
   -  Change column type
   -  Creating table
-  Implementing stragtegie that detect changes and altering the downstream pipelines is required to avoid breaks

### Schema Registry

A  schema  registry  is  a  metadata repository used to maintain schema and data type integrity in the face of constantly changing schemas for streaming data.

### Matadata  

Metadata is data about data.
Metadata  can  be  as  critical  as  the  data  itself.

## Pull and Push

- A push strategy involves a source system sending data to a target
- Pull strategy entails a target reading data directly from a source
    - Polling  involves periodically checking a data source for any changes. When changes are detected, the destination pulls the data as it would in a regular pull situation.

## Batch Ingestion 

Ingest data in bulck

- Time-interval batch ingestion
- Size-based batch ingestion

### Commong pattern

- Snapshot or Diff erential Extraction: to  capture  full  snapshots  of  a  source  system or differential (sometimes called incremental) updates
- File-Based Export and Ingestion: data prepared and packaged in source system and then send to destinatin via common file-exhange method like object storage, Secure File Transfer Transport (SFTP), Secur Copy (SCP), Electoric Data Interchange (EDI).
- ETL vs ELT
- Inserts, Updates, and Batch Size
- Data Migration