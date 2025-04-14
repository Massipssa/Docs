# Azure Storage Account

- It's a big service designed for storage in Azure
- Highly scalable (up to petabytes of data)
- Highly durable
- It contains the following services
     
- **Azure Blob Storage**
  - Used to store any kind type of data (unstructured data)
  - Three storage tiers
    - **Hot**: frequently accessed data
    - **Cool** 
      - Infrequently accessed data (lower availability and high durability)
      - Useful to store older versions and backups of applications 
    - **Archive:** rarely accessed data
  
- **Azure Queue Storage**
  - Store small pieces of data (messages)  
  - Designed for scalable asynchronous processing
 
- **Azure Table Storage**
  - Store semi-structured data
  
- **Azure File Storage**
  - Similar to Blob Storage
  - In case of file we access Shares (in Blob we access containers)
  - Accessed via ***shared drive*** protocols
  - Designed to ***extend on-premise file shares*** or implement ***lift-and-shift*** scenarios

- **Azure Disk Storage**
  - Disk emulation in the cloud
  - Persistent storage for virtual machines
  - Different
     - Sizes
     - Types (SSD, HDD)
     - Performance tiers
  - Disk can be **undamaged** or **managed**
    
## Replication
    
- Locally-redundant storage (LRS)
- Zone-redundant storage (ZRS)
- Geo-redundant storage (GRS)
- Geo-zone-redundant storage (GZRS)
    
    
    
    
