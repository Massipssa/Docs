* Zone
* Availability Zone (AZ)
* Connectivity
* Services
* VPC: Virtual Private Cloud

### Services locations 
* S3, Dynamo DB .... on region
* EC2, ... on AZ

### CloudWatch

### SNS

### Amazon Machine Image (AMI)

* Used as backup

### EBS

### Auto Scaling

### Amazon Load Balancer

* When trafic come to the application it'll flow throw the **ALB** and will be dispatshed 
to **EC2**

### CloudFront

* Is used **Content Distributed Network (CDN)**
* Take content and copy it to diffente edges location around the world
* For example if we have some videos (static content and we want to share them around the word), share backets, ...

### Retational Database Service (RDS)

* Create reational databases
* Instance for prod, dev/test and free tier

### Amazon lambda

### EC2 Princing

* **On-demand**
* **Reserved Instances (RI)**
* **Spot Instances:** can be terminated at any time
* Dedicated
    * Most expensive
    * Multi-Tenant (virtual isolation with other consumers) vs Single Tenant (physical isloation with other cosumers)



## VPC

* **Internet Gateway:** a virtual router to connect VPC to internet
* **Route Table:**
* **Subnet:** ex: eu-west has 3 AZ => 3 subnets
* **Security group:**
    * We can add any ***allowing*** rules (open ports)
    * It's linked to instances
* **Network Access Control Lists (NACLs):**
    * It be used to block specific IP address or range of IP address
    * Can ***allow*** and ***deny*** rules
    * It's linked to subnet
* **Bastion:** get acces via SSH to private subnet
* **NAT Gateway:**
    * Access internet from private subnet
    * One sense private subnet --> internet
* **VPC Endpoints**
    * Access AWS services from private subnet

* **VPC Flow logs**: Track the logs

## CLI

## Software Development Kit (SDK)

* Control multiple AWS services using popular programing languages

## Cloud9

* A cloud IDE for writing, running, and debugging code


## Storage

### Elastic Block Store

* A **virtual hard drive** in the cloud
* Create new volumes attach to EC2 instances backup via snapshots and easy encryption

## CloudFront

