# VPC

Logically isolated part of cloud where you can define your owen network

## Internet Gateway

- VPC can only have one Internet Gateway
- A virtual router to connect VPC to internet
- It's responsible for a **_Static Network Address Translation_** (translate private ip to public ip)

## Route Table

- One route table per VPC
- Controls what's VPC router does with traffic leaving subnet

## Subnet
- Is a virtual firewall
- ex: eu-west has 3 AZ => 3 subnets
- By default, is private
- A subnet is always assigned to one AZ 

## Security group

- We can add any **_allowing_** rules (open ports)
- It's linked to instances

## Network Access Control Lists (NACLs):**
- Is an optional layer of security for VPC that acts as a firewall controlling traffic in and out of one or more subnets
- It is used to block specific IP address or range of IP address
- Can **_allow_** and **_deny_** rules
- It can have multiple subnets but a subnet is only associated to only one NACLs
- They are stateless

## NAT Gateway

- Access internet from private subnet
- One sense private subnet **==>** internet
- Redundant inside AZ 
- Start at 5 Gbps and scales currently to 45 Gbps (Bandwidth)
- No need to patch 
- No associated to Security Group
- Automatically assigned a public IP address

## VPC Endpoints

- Access AWS services from private subnet
- Two types
  - Interface endpoints 
  - Gateways endpoints (Support connection to S3 and DynamoDB)

## VPC Flow logs ...

- Track the logs

## Difference Security Group and NACLs

- Security groups are assigned to a specific resource, while NACLs are assigned to a subnet
- Security groups do not allow explicit denies, while NACLs do
- Security groups are stateful, while NACLs are stateless

## VPC Peering

- Link VPCs together
- Allows you to connect 1 VPC with another via a direct network route using private IP address   
- Instances behave as they were in the same VPC
- We can peer between region
- Transitive peering is not supported
- No overlapping CIDR address ranges
- Data is encrypted

## PrivateLinks

- ???

## CloudHub

- Connect multiple sites 
- Low cost and easy to manage 
- It operates over public network, but all traffic between customer gateway and AWS VPN CloudHub is encrypted

## Direct Connect

- Establish connection from on-premise to AWS 
- Two types 
  - Dedicated connection 
  - Hosted connection 
- Useful for high throughput workloads 
- Helpful when you need stable and reliable secure connection  

## Transit Gateway

- Connects VPCs and on-premise networks through a central hub 

## AWS Wavelength
- AWS service embeds AWS compute and storage services within 5G networks,
providing mobile edge computing infrastructure for developing, deploying, and scaling ultra-low-latency applications

## Bastion

- Get access via SSH to private subnet