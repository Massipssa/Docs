# Security Services

- [Security Services](#security-services)
  - [AWS Shield](#aws-shield)
  - [SSM Parameter Store](#ssm-parameter-store)
  - [AWS Secret Manager](#aws-secret-manager)
  - [AWS Audit Manager](#aws-audit-manager)
  - [GuardDuty](#guardduty)
  - [Macie](#macie)
  - [Amazon Inspector](#amazon-inspector)
  - [Cloud HSM](#cloud-hsm)
  - [Presigned URLS](#presigned-urls)
  - [AWS Certificate Manager (ACM)](#aws-certificate-manager-acm)
  - [AWS Artifact](#aws-artifact)
  - [Amazon Detective](#amazon-detective)
  - [Firewall manager](#firewall-manager)
  - [Network firewall](#network-firewall)
  - [Security Hub](#security-hub)

## AWS Shield

- Network protection service
- Offer free DDOS protection
- Protect against **layer 3** and **layer 4** attacks only
- Protects all AWS customers on ELB, CloudFront and Route S3
- Protects against:
  - [SYN/UDP floods](https://www.cloudflare.com/learning/ddos/syn-flood-ddos-attack/)
  - [Reflection attacks](https://en.wikipedia.org/wiki/Reflection_attack)
  - And other Layer 3 and Layer 4 attacks

## SSM Parameter Store

- Secure storage for configuration and secrets
- Optional Seamless Encryption using KMS
- Serverless, scalable, durable, easy SDK
- Version tracking of configuration / secrets
- Security through IMA
- Notification with Amazon EventBridge
- Integration with CloudFormation

## AWS Secret Manager

- Store securely application secrets, database credentials, API Keys, SSH Keys, passwords, etc
- Rotation can be used  
- Automate generation of secrets on rotation
- Integrated with Amazon RDS
- Replicate Secrets across multiple AWS Regions
- It keeps read replicas in sync with primary Secret

## AWS Audit Manager

- Continually audit your AWS usage
- Automated service that produces report to auditors for PCI, GDPR and more

## GuardDuty

- A threat detection service that uses machine learning to continuously monitor for malicious behavior
- Looks for
  - Unusual API calls, calls from a known malicious IP
  - Attempts to disable CloudTrail logging
  - Unauthorized deployments
  - Compromised instances
  - Reconnaissance by would-be attackers
  - Port scanning, failed logins
- Log analyzed
  - CloudTrail logs
  - VPC Flow logs  
  - DNS logs

## Macie

- Uses machine learning and pattern matching to discover sensitive data stored in S3

## Amazon Inspector

- Is an automated security assessment service that helps improve the security and compliance of application deployed on AWS
- Inspects the **network**, **EC2 instances**, **Amazon ECR** and **Lambda Functions**
- Two types of assessment
  - Network assessment
  - Host assessment

## Cloud HSM

- KMS => AWS Manages software for encryption
- CloudHSM => AWS provisions encryption **hardware**
- Dedicated Hardware (HSM = Hardware Security Module)
- You manage your own encryption keys entirely (not AWS)
- The CloudHSM hardware device is tamper resistant
- FIPS 140-2 Level 3 compliance
- CloudHSM cluster are spread across multi AZ (HA)
- Supports both **symmetric** and **asymmetric** encryption (SSL/TLS keys)
- No free tier available
- Must use the CloudHSM Client Software

## Presigned URLS

- Generate an url which provides temporary access to an object to either upload or download object data
- They are commonly used to provide access to private objects
- You can use AWS CLI or AWS SDK to generate presigned urls
- Used to share private buckets in S3

## AWS Certificate Manager (ACM)

- Allows to create, manage, and deploy **public** and **private** SSL certificates for use with other AWS services
- No more paying for SSL certificates. You pay for the resources that utilize your certificates (such as ELB)
- Renew and deployment can be automated
- Easy to set up

## AWS Artifact

- Single source you can visit to get the compliance-related information that matters to you, such as AWS security and compliance reports or select online agreements
- Free service

## Amazon Detective

- Analyze and investigate and quickly identify the root cause of potential security issue or suspicious activities

## Firewall manager

- Is security management service in single pane of glass
- This allows to centrally set up and manage firewall rules across multiple AWS accounts and applications in AWS Organizations
- It is integrated with AWS Organizations so you can enable AWS WAF rules, AWS Shield Advanced protection, security groups, AWS Network Firewall rules, and Amazon Route 53 Resolver DNS Firewall rules

## Network firewall

- Managed service that makes it easy to deploy physical firewall protection across your VPCs

## Security Hub

- A single place to view all your security alerts from services like Amazon GuardDuty, Inspector, Macie
  and AWS Firewall
- Performs security best practice checks
- Aggregates alerts
- Enables automated remediation
