# Dataflow

- Fully managed service for executing Apache Beam pipelines within GCP  
- Allows code optimization
- Dynamic workload re-balancing (straggler problem)
- Autoscaling (more or less workers)
- Is serverless and NoOps
- Designed to be low maintenance
- Pipelines are regional based
- Integrates with other tools like Bigquery, pub/sub using connectors
- Best practices:
  - Handles errors
    - Gracefully catch errors using **Try-Catch** blocks
    - Output errors to **PCollection** and set the collector for the later analysis
    - Think about it as **recycling** the **bad** data
  - **How to update exiting code ?**
- Window
  - Global
  - Fixed
  - Sliding
  - Session

## IAM ??