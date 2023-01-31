## Shared responsibility 
- Responsibility is shared between the cloud provider and consumer
 - IaaS
 - PaaS
 - SaaS

- Consumer is always responsible for 
 - Devise used to connect to the cloud 
 - Data and information sotred 
 - The accounts and identities of people, services and devices used by the organization
- Provider is always responsible for
 - Physical hosts 
 - Physical network 
 - Physical datacenters
   

## Cloud models 
- private
- public 
- hybrid 
- multi-cloud

## Cost
- Capital expenditure (CapEx)
- Operational expenditure (OpEx)

## Tools to interact with azure 
- Azure portal 
- CLoud shell
 - Supports PowerShell and Bash 
- Azure CLI

## Manage service in Azure and on-premise

- Azure Arc 
  - simplifies governance and management by delivering a consistent multi-cloud and on-premises management platform
  - It can manage
    - servers 
    - k8s cluster 
    - SQL servers 
    - VM
- Azure data services 

## Provision resource
- Azure Resource Manager

## Monitor 

- Azure Advisor
  - Evaluate resource and makes recommendations to help to improve the usage of the resource
- Azure Service Health
  - helps you keep track of Azure resource, both your specifically deployed resources and the overall status of Azure.
  - Combines three services:
    - Azure status
    - Service Health
    - Resource Health 
- Azure Monitor
  - Collect, analyze, visualize and acts on data 
  - Can monitor resource on Azure, on-premise and multi-cloud
- Azure Log Analytics
- Azure Monitor Alerts

- Application Insights: 
 - monitors your web applications
 - Can monitor applications running on Azure, on-premise and multi-cloud 

## Azure Blueprints
- Standardize cloud subscription or environment deployment 
- Each component know as artifact
- No additional parameters are required 

## Azure Policy
- How to ensure that resources stay compliant
- Types
  - individual policies 
  - groups policies (initiatives)  
- Can be set on 
  - resource 
  - resource group 
  - subscription
- Are inherited 

## Azure locks
- Prevent a resource for been deleted or changed
- can be applied to resource, group event to subscription 
- locks are inherited 

## Service Trust portal 
- Portal that gives access to various tools, content and resources about Microsoft privacy, security and compliance 
