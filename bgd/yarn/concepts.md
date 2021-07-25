# Yarn

## Components 

- **Resource Manger** 
    * **Scheduler**
      - Schedule job based on resources available within the cluster. 
    * **Application Manager** 
      - Accepts job-submission.
      - Negotiates the first container with scheduler in order to create **Application Master**.
      - Provides the service for restarting the ApplicationMaster container on failure.
      - **ApplicationMaster:** is per-application, and it has the responsibility of negotiating appropriate resource containers
        from the Scheduler, tracking their status and monitoring for progress

- **Node Manger** 
  - Responsible for containers, monitoring their resources usage (cpu, memory, disk, network) 
    for Resource Manager.
