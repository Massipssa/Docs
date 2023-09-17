## Organizations

- Is a free governance tool that allows you to create and manage multiple AWS accounts
- Service control policies (SCPs)
- Can control your accounts from a single location rather than jumping from account to account 

## Resource Access Manager (RAM)

- Share resources with other AWS accounts 



## Cross Account Role Access

- Define an IAM Role for another account to access
- Define which accounts can access this IAM Role
- Use AWS STS to retriecve credentials and impersonate the IAM Role you have access to (AssumeRole API)
- Temporary credentials can be valid betweeen 15 minutes to 1 hour


## AWS Config

- An inventory management and control tool
- It allows to show the history of your infrastructure along with creating rules to make sure it conforms to the best 
  practices you've laid out

## Directory Service

- Fully managed service of active Directory 
- Two components 
  - Microsoft AD 
  - Connector AD

## Compute Optimizer 


## Trusted Advisor 

- Fully managed best-practice auditing too
- Provides realtime guidance to help you provision your resources following AWS best practices
- Trust advisor checks help optimize your AWS infrastructure, increase security and performance, reduce your overall costs, 
   and monitor service limits
- It'll scan 5 different parts of your account and look for places where you could improve your adoption of the
  recommended best practices provided by AWS


## AWS Control Tower 

- Way to set up and govern an AWS multi-account environment 
- Automates account creation and security controls via other AWS services

## AWS Licence Manager 

- Simplifies managing software licences with different vendors 

## AWS Health 

- Gain visibility of resources and availability of AWS services or accounts 
- Receive notifications and alerts for affected resources and upcoming events
- Automate actions based on events using **EventBridge**

## AWS Service Catalog 

- Allow organization to create and manage catalogs of approved IT services 
- **Standardize**: restrict launching products to a specific list of preapproved solutions 
- **Self-service**: end users can browse products and deploy approved service on their own 
- **Access control**: add constraints and grand access to products using AWS IAM 
- **Versionning**: update products to newer versions and propagate changes automatically

## AWS Proton 

- Is service that create and manage infrastructure and deployment tooling for users as well as serverless and 
  container-based application
- Automate IaC provisioning and deployments 
- Define standardized infrastructures for user serverless and container-based apps 
- Use templates to define and manage apps stacks that contain all components 
- Automatically provision resources, configure CI/CD, and deploys the code 
- Supports AWS CloudFormation and Terraform IaC providers

## AWS Well-Architected Tool 

- Operational Excellence 
- Reliability 
- Security 
- Performance Efficiency 
- Const Optimization 
- Sustainability 