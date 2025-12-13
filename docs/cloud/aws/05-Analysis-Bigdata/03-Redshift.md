# Redshift

## Architecture

![redshift_archi](screenshots/redshift_archi.PNG)

- Performance
  - Massively Parallel Processing (MPP)
  - Columnar Data Storage
  - Column Compression (is column level operation, reduce space, reduce disc I/O)
- Is a single AZ
- Block size of 1MB
- Indexes are materialized but not required
- Data is stored in three different places:
  - Original data within cluster
  - Backup within cluster
  - Backup in S3

- **Durability**

- **Distribution Styles**
  - AUTO
  - EVEN
  - KEY
  - ALL

- **Sort Keys**
  - Single column
  - Compound (default)
  - Interleaved

## Snapshots and DR

- Redshift has **Multi-AZ** mode for some clusters
- Snapshots are point-in-time backups of a cluster stored internally in S3
- Snapshots are incremental (only what has changed is saved)
- It can be restored into a **new cluster**
- Can be
  - **Manual**: snapshot is retained until you delete it
  - **Automatic**: e.g every 8 hours, every 5 GB, or on schedule. You can set a retention for a automated snapshot
- You can configure Redshift to copy snapshot either they are manual or automatic into another region
  
## COPY command

- From S3, EMR, DynamoDB, remote hosts to Redshift
- S3 requires a manifest file and IAM role

- **UNLOAD command:** unload from a table into files in S3

## Redshift Spectrum

- Query the data is already in S3 without loading it into Redshift
