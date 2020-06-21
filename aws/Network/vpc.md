# VPC

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