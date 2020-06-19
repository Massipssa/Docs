# Basics

- [Compute](#compute)
    -  [App Engine](#apengine)
    -  [Compute Engine](#computeangine)
    -  [Kubernetes Engine](#kubernetes)
    -  [Cloud Functions](#functions)

- [Network](#network)
- [Data Transfert](#datatransefert)

## Compute <a name="compute"></a>

### App Engine <a name="apengine"></a>

- Is Paas (Platform as Service)
- Auto scaling and and Load-Balancing
- Two environments:
    - Standard
    - Flexible

### Compute Engine <a name="computeangine"></a>

- Is IaaS (Infrastructure as Service)
- Scalable and high perforamnce VMs
- Two types instances group:
    - Managed: collection of instances that are identical
    - Unmanaged: collection of instances with different config

### Kubernetes Engine <a name="kubernetes"></a>

- Managed orchestrated environnement for containerrized app
- Serverless
- Benefits:
    - Load Balancing intergrated
    - Automtic upgrade
    - Logging and monitoring is handled by stackdriver
    - ...

### Cloud Functions <a name="functions"></a>

- Runs in response to the event
- Serverless
- Pay for CPU and RAM
- Each function get HTTP endpoint


## Network <a name="network"></a>

### VPC

### Load Balancer

### Cloud CDN

- Accelerate delivery from Compute Engine and Cloud Storage
- Lower latency

## Data Transfert <a name="datatransefert"></a>

- **Data Transfert Appliance**
  - Transfert data from external storage to cloud
- **Data Transfert Appliance**
  - Transfert data from cloud to cloud