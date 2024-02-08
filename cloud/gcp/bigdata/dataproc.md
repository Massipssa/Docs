# Dataproc

- Deploy On demand, managed Hadoop, Spark cluster
- Connectors to Google services are already added (reduce administrator work)
- Other ecosystem tools can be instated via **initialization**
  - Initialize action: install tools like Kafka by given the location of the bucket and when cluster starts, it'll install the tool
  - Bucket location: ```gsutil ls gs://dataproc-initialization-actions```
- Create a cluster:

  ```gcloud dataproc create cluster [cluster_name] --zone [zone_name]```

- Available connectors:
  - Spark, Hadoop <=> Bigquery, CloudStorage, Bigtable
- Preemptive nodes (VMs)
  - Excellent low cost worker nodes
  - Dataproc manages entire leave/join process
- Access cluster
  - Master node is in the same zone from where gcloud is running ```ssh [master-node-name]```
  - ```gcloud compute ssh [master-node-name] --zone [zone_name]```
- Access via Web GUI
  - Open firewall port to network
  - Use SOCKS proxy - does not expose firewall ports

## IAM

## Connect to Dataproc

- Open ssh tunel to service like yarn GUI ```gclould compute ssh ....```
- Connect to vm:
  - Generate ssh key using ```ssh key-gen ....```
- See: https://www.youtube.com/watch?v=6DD-vBdJJxk

## Monitoring and logs

- Use Cloud logging and Cloud Monitoring
