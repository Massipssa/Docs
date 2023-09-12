# EC2

## AMI (Amazon Machine Image)

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

### ENI (Elastic Network Interface), IP, and DNS

- For day-to-day networking
- It provides 
  - Private IPv4 addresses
  - Public IPv4 address
  - Many IPv6 address
  - MAC address 
  - 1 or more Security Groups 
  
- Public instance
  - Has public IP
  - Public IP is changed when an instance is stopped
- Private instance
  - Private IP doesn't change

### EN (Enhanced Network)

- Uses single I/O virtualization to provide high performance 

### EFA (Elastic Fabric Adapter)

- Accelerates High Performance Computing (HPC) and machine learning applications 


## Placements 
A way to logically grouping instances 
- Cluster 
- Spread 
- Partition 

## Elastic IP

- Allows to allocate IP address to an instance

## Outposts 
