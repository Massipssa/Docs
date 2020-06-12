
## Big Data

### Dataproc

- Allows to deploy spark cluster
- Open ssh tunel to service like yarn GUI ```gclould compute ssh ....```
- Connect to vm:
  - Generate ssh key using ```ssh key-gen ....```
- See: https://www.youtube.com/watch?v=6DD-vBdJJxk
  
### Pub/Sub

- Global scale message buffer/coupler
- No-ops, globaly availabilityn auto-scaling
- Decouple sender and receiver
- Garantee **At-last-once**
- Asynchrounous messaging (ex: many-to-many) or other combinaison
- Message are stored in **Message Storage**
- Kafka Connect can be user to link PubSub to Kafka

### Dataflow

- Fully managed service
- Allows code optimization
- Dynamic workload rebalancing (straggler problem)
- Autoscaling (more or less workers)
- No-ops
- Pipelines are regional based
- Integrates with other tools like Bigquery, pub/sub using connectors
- Best practices:
  - Handles errors
    - Gracefully catch errors using **Try-Catch** blocks
    - Output errors to **PCollection** and set the collector for the later analysis
    - Think about it as **recyling** the **bad** data
  - **How to update exiting code ?**
- Window
  - Global
  - Fixed
  - Sliding
  - Session

## Data Transfert

- **Data Transfert Appliance**
  - Transfert data from external storage to cloud
- **Data Transfert Appliance**
  - Transfert data from cloud to cloud

## Compute

- **Cloud Functions**
  - Serverless
  - Pay only when code is running
  - Are event-driven
  - Two types:
    - HTTP functions: triggred by http events like Git, Slack, ...
    - Background functions

## Databases

### Cloud SQL

- Postgresql
- Myqsl
- SQL Server

### Cloud Datestore
  
- No relational database
- NoSQL
- One Datastore per project
- Data structure:
  - Kind <=> Table
  - Entity <=> Row
  - Property <=> Column
  - Key <=> Primary Key
- Consistency:
  - How up to date are the results ?
  - Does the order matter ?
  - Two types of consistencies:
    - ***Strongly:*** order matter but quries are long
    - ***Enventualy:*** order not matter but quries are very fast

## Dashbord and visualization

### Data Studio

  - Caches ??

## Machine Learning

- What's ML
