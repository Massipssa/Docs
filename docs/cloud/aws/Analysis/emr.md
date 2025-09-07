# Elastic Map Reduce (EMR)

- Create a Hadoop clusters to process and analyze a vast amount of data
- The cluster can be made of hundreds of EC2 instances
- We can autoscale the cluster and it's integrated with EC2 spot instances
- Nodes:
  - **Master node:** manage the cluster
  - **Core node:** run tasks and store data
  - **Task node (optional):** juste to run task (usually spot node)