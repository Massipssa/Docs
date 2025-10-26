# Migration Services

- [Migration Services](#migration-services)
  - [Snow Family](#snow-family)
  - [Storage Gateway](#storage-gateway)
  - [AWS DataSync](#aws-datasync)
  - [AWS Transfer Family](#aws-transfer-family)
  - [Migration Hub](#migration-hub)
  - [AWS Application Discovery Service](#aws-application-discovery-service)
  - [AWS Application Migration Service](#aws-application-migration-service)
  - [AWS Database Migration Service](#aws-database-migration-service)
  - [AWS Backup](#aws-backup)

## Snow Family

- **Snowcone**
  - 8 TB of storage, 4 GB of memory and 3 vCPUs
  - IOT sensor migration
- **Snowball Edge**
  - 48 to 81 TB in storage
- **Snowmobile**
  - 100 PB of storage

## Storage Gateway

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

## AWS DataSync

- Move large amount of data to and from
  - On-premises / other cloud to AWS (NFS, SMB, HDFS, S3 API ...)
  - Needs agent
- An agent-based solution for migrating on-premises storage to AWS
- It allows to easily move data between **NFS** and **SMB** shares and AWS storage solutions

## AWS Transfer Family

- Allows to easily move files **in** and **out** of S3 or EFS FTP Protocol
- It supports:
  - File Transfer Protocol (FTP)
  - File Transfer Protocol over SSL (FTPS)
  - Secure Transfer Protocol (SFTP)
- Managed infrastructure, Scalable, Reliable, Highly Available (multi-AZ)

## Migration Hub

- Gives a single place to track the progress of your applications migration to AWS
- It integrates with Server Migration Service (SMS) and Database Migration Service (DMS)

## AWS Application Discovery Service

- Helps plan (track) migrations to AWS via collection of usage and configuration data from on-premise servers
- Two types:
  - Agentless Discovery (AWS Agentless Discovery Connector)
  - Agent-based Discovery (AWS Application Discovery Agent)

## AWS Application Migration Service

- Is the primary migration service recommended for lift-and-shift migrations to AWS
- AWS encourages customers who are currently using AWS Elastic Disaster Recovery to switch to AWS MGN for future migrations
- AWS MGN enables organizations to move applications to AWS without having to make any changes to the applications, their architecture, or the migrated servers

## AWS Database Migration Service

- Helps you migrate databases to AWS quickly and securely
- The source database remains fully operational during the migration, minimizing downtime to applications that rely on the database
- Can migrate your data to and from the most widely used commercial and open-source databases
- Supports homogeneous migrations such as Oracle to Oracle, as well as heterogeneous migrations between different database platforms, such as Oracle or Microsoft SQL Server to  Amazon Aurora.
- Can continuously replicate your data with high availability and consolidate databases into a petabyte-scale data warehouse by streaming data to Amazon Redshift and Amazon S3
- **AWS Schema Conversion Tool (SCT)**:
  - Convert db schema from one engine to another

## AWS Backup

- Fully managed service
- Centrally manage and automate backups across AWS services
- No need to create scripts and manual processes
- Supports cross-region backups
- Supports cross-account backups
