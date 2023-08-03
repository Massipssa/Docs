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

## IAM

- Three check are performed when a job is submitted to Dataflow 
  - User role with IAM 
    - Dataflow Viewer 
    - Dataflow Developer 
    - Dataflow Admin 
  - Dataflow Service Account
    - Interact between your project and Dataflow 
    - Used for user creation and monitoring
    - Assigned the Dataflow Service Agent role 
  - Controller Service Account 
    - Used by the workers to access resources needed by the pipeline 

## Quota

- CPU quota
  - Is the total number of virtual CPUs across all of your VM instances in a region or a zone
- IP address:
  - Quota limits the number of VMs that can be launched with an external IP address for each region in your project
- Persistent disk

## Security 

- Data locality 
- Sharded VPC
- Private IPs
- CMEK

## Beam best practices 
- Use schema 
- Handling un-processed data
- Error handling 
- AutoValue code generation
- Json data handling
- Utilize DoFn function
- Pipeline optimizes 