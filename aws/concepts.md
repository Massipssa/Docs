* Zone
* Availability Zone (AZ)
* Connectivity
* Services
* VPC: Virtual Private Cloud 

### Services locations 
* S3, Dynamo DB .... on region
* EC2, ... on AZ

## CloudWatch

## SNS

## Amazon M.. Image (AMI)

* Used as backup

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

* On-demand
* Reserved Instances (RI)
* Spot Instances: can be terminated at any time
* Dedicated
    * Most expensive
    * Multi-Tenant (virtual isolation with other consumers) vs Single Tenant (physical isloation with other cosumers)

