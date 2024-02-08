# EC2

## AMI (Amazon Machine Image)

- AMIs are built for a specific AWS Region, they're unique for each AWS Region. You can't launch an EC2 instance using
  an AMI in another AWS Region, but you can copy the AMI to the target AWS Region and then use it to create
  your EC2 instances.
- Contains
  - Snapshots, permissions and block device mapping
  - Best practice: Stop the image before creating the image
- Can be:
  - Private
  - Public
  - We can add account to use the image
- Advantage of using AMI
  - IAM pre-backing ??
  - Immutable IAM ??
- Used when we need just static provisioning

## Boostrap

- Give an EC2 instance a series of instructions to do (Customize an instance)
- We can use:
  - Bash (linux) powershell (windows) file
  - Cloudinit file
- Used to dynamically provision an instance

## Network

## Elastic IP

- Allows to allocate IP address to an instance
- You can only have 5 Elastic IP in the account (Ask AWS to increase the number)

## Placements group

A way to logically grouping instances

- **Cluster**
  - 1 AZ
  - Good for High Performance Application
- **Spread**
  - Each instance is placed on a different rack
  - When critical instances should be keep separate from each other
  - You can spread a max 7 instances. Spreads can be multi-AZ
- **Partition**
  - Spread instances across partitions
  - Each partition do not share the underlying hardware with each other (rack per partition)
  - Well suite for large distributed and replicated workloads (Hadoop, Cassandra, Kafka)

### ENI (Elastic Network Interface), IP, and DNS

- For day-to-day networking (Which gives EC2 instance networking connectivity)
- It provides
  - Private IPv4 addresses (one primary private IPv4 and one or more secondary private IPv4)
  - Public IPv4 address
  - Many IPv6 address
  - MAC address
  - One or more Security Groups
  
- Public instance
  - Has public IP
  - Public IP is changed when an instance is stopped
- Private instance
  - Private IP doesn't change

### EN (Enhanced Network)

- Uses single I/O virtualization to provide high performance

### EFA (Elastic Fabric Adapter)

- Accelerates High Performance Computing (HPC) and machine learning applications

## Launch Template

- IAM type
- EC2 role
- SG

## Outposts
