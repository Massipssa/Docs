# Elastic Container Service (ECS)

- A container is a standard unit of software that packages up code and all its dependencies, so the application runs
quickly and reliably from one computing environment to another
- Two mode
  - **EC2 Mode**: ec2 instances to managed by the customer
  - **Fargate Mode**: managed by aws
- Integrate with ELB 
- Role integration 
- Ease to use 

## Amazon ECS Fargate

- Fargate's containers offer the least disruptive changes, while also minimizing the operational overhead of managing 
 the compute service

## ECS Service Auto Scaling

- Automatically increase/decrease the desired number of ECS task 
- Uses AWS Application Auto Scaling
  - ECS Service Average CPU Utilization 
  - ECS Service Average Memory Utilization -Scale on RAM 
  - ALB Request Count Per Target - metric coming from the ALB 

- Target Tracking: scaled based on target value for a specific CloudWatch metric
- Step Scaling: scale based on a specified CloudWatch Alarm  
- Scheduled Scaling: scale based on a specified date/time (predictable changes) 

## EKS Distro

- Amazon EKS is based on the EKS Distro, which allows you to leverage the best practices and established processes 
  on-premises that Amazon EKS uses in AWS
