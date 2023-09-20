# AWS Shield

- Free DDOS protection 
- Protect against layer 3 and layer 4 attacks only 
- Protects all AWS customers on ELB, CloudFront and Route S3
- Protects against SYN/UDP floods, reflection attacks, and other Layer 3 and Layer 4 attacks

# AWS Audit Manager 

- Continually audit your AWS usage 
- Automated service that produces report to auditors for PCI, GDPR and more

# GuardDuty

- A threat detection service that uses machine learning to continuously monitor for malicious behavior
- Looks for
  - Unusual API calls, calls from a known malicious IP
  - Attempts to disable CloudTrail logging 
  - Unauthorized deployments
  - Compromised instances 
  - Reconnaissance by would-be attackers 
  - Port scanning, failed logins 

# Macie

- Uses machine learning and pattern matching to discover sensitive data stored in S3

# Inspector 

- Is an automated security assessment service that helps improve the security and compliance of application deployed 
  on AWS 
- Inspects the **network** and **EC2 instances**
- Two types of assessment 
  - Network assessment 
  - Host assessment 

# Key Management Service (KMS)

- Create and control (manages) keys used to encrypt the data 
- Fully managed 

# Cloud HSM

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

# Secret Manager 

- Store securely application secrets, database credentials, API Keys, SSH Keys, passwords, etc 
- Rotation can be used  

# Parameter Store 


# Presigned URLS 

- Used to share private buckets in S3 

# Certificate Manager

- Allows to create, manage, and deploy public and private SSL certificates for use with other AWS services 
- No more paying for SSL certificates. You pay for the resources that utilize your certificates (such as ELB)
- Renew and deployment can be automated
- Easy to set up 

# AWS Artifact 

- Single source you can visit to get the compliance-related information that matters to you, such as AWS security and 
  compliance reports or select online agreements
- Free service

# Amazon Detective 

- Analyze and investigate and quickly identify the root cause of potential security issue or suspicious activities

# Firewall manager 

- Is security management service in single pane of glass
- This allows to centrally set up and manage firewall rules across multiple AWS accounts and applications in
  AWS Organizations

# Network firewall 

- Managed service that makes it easy to deploy physical firewall protection across your VPCs

# Security Hub 

- A single place to view all your security alerts from services like Amazon GuardDuty, Inspector, Macie 
  and AWS Firewall
- Performs security best practice checks
- Aggregates alerts
- Enables automated remediation