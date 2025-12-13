# Storage Gateway

- Hybrid cloud storage service helps to merge on-premises resources with the cloud
- It can help with a one-time migration or a long-term pairing of your architecture with AWS
- Types
  - **S3 File Gateway**
    - Configured S3 buckets are accessible using the **NFS** and **SMB** protocol
    - Most recently used data is cached in the File gateway
    - Bucket access using IAM roles for each File Gateway
    - SMB Protocol has integration with Active Directory (AD) for user authentication
  - **FSx File Gateway**
    - Native access to Amazon FSx for Windows File Server
    - Local cache for frequently accessed data
  - **Volume Gateway**
    - Block storage using **iSCSI** protocol backed by S3
    - Two types
      - Cached volumes
      - Stored volumes
  - **Tape Gateway**
    - Some companies have backup process using physical tapes
