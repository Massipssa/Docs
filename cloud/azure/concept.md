# Azure basics

## Benefits
- Cost-effective: you pay for what you consume. Pay-as-you-go (PAYG)
- Global: we can choose regions in every part in world
- Secure: cloud provider put a lot of effort to secure services
- Reliable
  - data backups
  - disaster recovery
  - data replication
  - fault tolerance
- Scalable: increase and decrease resources and services based on demand
- Elastic: automate scaling during the spikes and drop in demand

## Cloud services type
- SaaS (Software as a Service) --> For customers
- PaaS (Platform as a Service) --> For developers 
- IaaS (Infrastructure as a Service) --> For Admins

## Cloud types
- **Public Cloud:** everything is built on the cloud provider (Known also as Cloud-Native)
- **Private Cloud:** everything is built on the company's datacenter (Known also as On-premise)
- **Hybrid Cloud:**  using both On-premise, and a Cloud Service Provider

## Advantages
- High Availability
- High Scalability
  - Scale up (vertical scaling)
  - Scale out (horizontal scaling)
- High Elasticity (scale automatically)
- High Durability
  - Be fast to restore in case of disaster

## Global infrastructure
- A **region** a grouping of multiple datacenters (Availability Zones)
  - 58 regions available across 140 countries
- A **geography** is discreet market of two or more regions that preserves data residency and compliance boundries
  - United States
  - Azure Government(US) 
  - Canada
  - Brazil 
  - Mexico
- **Paired region** each region is paired with another region **300 miles (ca. 483 km)**
- Two types of regions
  - **Recommended region**
    - Supports Availability Zones
  - Alternate (other) region
    - Do not support Availability Zones
- **General availability (GA)** is when a service is considered ready to be used publicly by everyone 
- Service available
  - **Foundational:** when GA,
    - Immediately or in 12 months in Recommended an Alternate Regions
  - **Mainstream:** When GA, 
    - Immediately or in 12 months in Recommended Regions
    - May become available in Alternate Regions based on customer demand
  - **Specialized:** available in Recommended or Alternate Region based on customer demand
- **Availability Zone (AZ)** is physical location made up of one or more datacenter
  - A region will generally contain **3 availability Zones**
  - Datacenters within a region will be isolated from each other (so different buildings). But they will be close enough
    provide low-latency
  - AZ is made of
    - **Fault domain**
    - **Update domain**
  
## Services
- **Compute services**
  - Azure VM 
  - Container instances..
  - Service Fabric
  - Functions
  - Batch

- **Storage services**
  - Azure Data Lake storage: to store structured and unstructured data (used when we are working with big data)

- **Database services**
  - Azure Cosmos DB 
    - A fully managed NoSQL databases
    - Designed for scale with a guarantee of 99,999% availability
  
  - Azure SQL Database
    - Fully managed MS SQL database with auto-scale
    - Integral intelligence and robust security
  - Azure Database for PostgreSQL/MYSQL/MariaDB
  - Azure Synapse Analytics (Azure SQL Data Warehouse)
  - Cache for Redis
- Application integration
  - Services that help applications to talk to each other
- Mobile
- ...

- Azure Resource Manage (ARM) for Infrastructure as Code
- Use Azure Quick Start Template to start up rapidly 

- Azure Virtual Network (vNet) and Subnets

- Big Data and Analytics Services
  - Synapse Analytics
  - HDInsight
  - Azure Databricks

- Key Vault: helps you safeguard cryptographic keys and other secrets used by cloud apps and services

- Azure Marketplace: apps and services are made available by a third-party publishers to quickly get started

- Support plans
  - Basic
  - Developer
  - Standard
  - Professional Direct

## Hierarchy 

  ```
  ---> Management group
    | 
    |---> Subscription
        |
        |--> Resource Group
           |
           |--> Resource
  ```      
  
## Resources
- Objects used to manage services in Azure
- Represent service lifecycle
- All resources are represented as Json template
  
### Resource group  
- Logic container for resources
- Grouping of resources
- Some strategies to group resources:
    - Type (sql, web, ...)
    - Lifecycle (app, environment) 
    - Departament
    - Billing, location or combination of those
- Resource can only be assigned to one resource group
- **IAM** is used to manage access  
- **Azure Resource Explorer** to view resource details

### Resource Manager
- Resources can be managed using one of these mean
   - Portal
   - Rest
   - Powershell
   - CLI
   - SDKs
- All the tools uses **Azure Resource Manager**
- RM controls access and resources