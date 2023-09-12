# EBS (Elastic Block Store)

- Storage volumes to attach EC2 instances to
- Encryption is disable by default
- Encryption can be enabled for all EBS at EC2 settings
- Snapshot from encrypted volume is always encrypted
- Instance created from encrypted AMI are also encrypted
- Encryption doesn't impact instance performance
- EBS Encryption
  - Data is encrypted ***at-rest*** and ***in-transit***

- **EBS-Optimization**
  - Separate Storage Path from Network Path

- Types 
  - General Purpose SSD (gp2): suitable for boot disks and general applications 
  - General Purpose SSD (gp3): suitable for high performance applications 
  - Provisioned IOP (io1): for OLTP and latency-sensitive applications 
  - Provisioned IOP (io2): for OLTP and latency-sensitive applications (with grate nb of IOPS)
  - Throughput Optimized HDD: for bigdata, warehouse and ETL
  - Cold HDD (sc1): less frequently accessed data and low cost applications

## Volumes and Snapshot

- **Volumes**
  - Are where the data is stored
  - They are always in the same AZ as EC2
  - Can be resized in the  fly
  - Can change the volume type in the fly 
- Snapshot: is a current state of the volume at point in time
- For consistent snapshot it's recommended to stop the instance  then take the snap
- Snapshot can only be shared in the region where they are created, to share them with other regions we need to copy them 
 to those regions