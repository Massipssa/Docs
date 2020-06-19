# Dataflow

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

## IAM ??