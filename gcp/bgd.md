
## Big Data

### Dataproc

- Allows to deploy spark cluster
- Open ssh tunel to service like yarn GUI ```gclould compute ssh ....```
- Connect to vm:
  - Generate ssh key using ```ssh key-gen ....```
- See: https://www.youtube.com/watch?v=6DD-vBdJJxk
- On demand, managed Hadoop, Spark cluster
- Connectors to Google services are already added (reduce administrator work)
- Other ecosystem tools can be instatted as wl via initialization
  - Intialize action: install tools like Kafka by given the location of the bucket and when cluster starts, it'll install the tool
  - Bucket location: ```gsutil ls gs://dataproc-initialization-actions```
- Create a cluster:
  - ```gcloud dataproc create cluster [cluster_name] --zone [zone_name]```

- Preemptive nodes (VMs)
  - Excellent low cost worker nodes
  - Dataproc manages entire leave/join process

- Access cluster
  - Master node is in the same zone from where gcloud is running ```ssh [master-node-name]```
  - ```gcloud compute ssh [master-node-name] --zone [zone_name]```

- Access via Web GUI
  - Open firewall port to network
  - Use SOCKS proxy - does not expose firewall ports

### IAM

## Pub/Sub

- Global scale message buffer/coupler
- No-ops, globaly availabilityn auto-scaling
- Decouple sender and receiver
- Garantee **At-last-once**
- Asynchrounous messaging (ex: many-to-many) or other combinaison
- Message are stored in **Message Storage**
- Kafka Connect can be user to link PubSub to Kafka

### IAM 

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

### IAM ??

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


## Dashbord and visualization

### Data Studio

  - Caches ??

## Machine Learning

- What's ML
