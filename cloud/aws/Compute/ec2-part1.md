# EC2

- IaaS
- Regional service
- Has an AMI (Amazon Machine Image)
- Can use ***Instance Store Volume***: they are not persistent and not secure
- Instance families
  - General purpose
  - Compute optimized
  - Memory optimized
  - Storage optimized
  - Accelerated computing

## Instance store volume

- Volume attached to EC2
- Offers some performance because is located in the same host as the instance
- It's ephemeral, if the instance remove the storage is removed too

## Elastic Block Store (EBS)

- A **virtual hard drive** in the cloud
- Create new volumes attach to EC2 instances
- Backup via snapshots
- Can be encrypted
- **IOPS ??**
- **Types ??**
- Size and the type can be changed without downtime
- Can be copied from zone to author one
- **Snapshot**
  - Create backup of the volume
  - Data is copied from EBS to S3, and they are ***replicated***
  - Best practice: shutdown the instance before making the snapshot
  - Can be private or public
  - Stores only the difference between two **successes!!** snapshot
- **Data Lifecycle Manager**
  - Used to automate the creation of the snapshot

<div style="text-align:center"> <img src="./screenshots/storage_ec2.png"> </div>

## Security Group (SG)

- A maximum **Five** Security Group per ***Elastic Network Interface (ENI)*** 
- Two types of rules: ***Inbound*** and ***Outbound***
- **Important** the two rules have ***Hidden Rule*** which is **Default Deny Rule**
- The traffic is stateful. We have juste to allow it in one direction
- Can reference another SG
- An SG can reference itself. Allow the services in the same groups to communicate between them

## Instance Metadata

- Allows an application to get the information about the instance
- Uses th url: **http://169.254.169.254/latest/meta-data**

## EC2 Printing

- **On-demand**
- **Reserved Instances (RI)**
- **Spot Instances:** can be terminated at any time
- Dedicated
  - Most expensive
  - Multi-Tenant (virtual isolation with other consumers) vs Single Tenant (physical isolation with other consumers)

<div style="text-align:center"> <img src="./screenshots/ec2_archi.png"> </div>