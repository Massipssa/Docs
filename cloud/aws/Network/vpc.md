# VPC

## Internet Gateway

- VPC can only have one Internet Gateway
- A virtual router to connect VPC to internet
- It's reponsible for a Static Network Address Translation (transalte private ip to public ip)

## Route Table

- One route table per VPC
- Controls what's VPC router does with trafic leaving subnet

## Subnet
  
- ex: eu-west has 3 AZ => 3 subnets
- By default is private

## Security group

- We can add any ***allowing*** rules (open ports)
- It's linked to instances

## Network Access Control Lists (NACLs):**

- It be used to block specific IP address or range of IP address
- Can ***allow*** and ***deny*** rules
- It's linked to subnet

## Bastion

- Get acces via SSH to private subnet

## NAT Gateway

- Access internet from private subnet
- One sense private subnet --> internet
- Bandwith ?

## VPC Endpoints

- Access AWS services from private subnet

## VPC Flow logs ...

- Track the logs

## Difference Security Group and NACLs

- Security groups are assigned to a specific resource, while NACLs are assigned to a subnet
- Security groups do not allow explicit denies, while NACLs do
- Security groups are stateful, while NACLs are stateless

## VPC Peering

- Link VPCs togther
- Data is encrypted


## VPC Endpoints


