- Azure Identity Service
    - Identity
      - User identity
      - Service principal (Hosted services, Application, Automated tool)
      - Managed identity
    
- Security principal 
  -  An object (identity) that can be assigned to a role
    
- **Azure AD**
    - Manages identity and access to resources
    - To manage AD the **Global administrator** role is required
    - Used by multiple Microsoft cloud platforms
        - Azure
        - Microsoft 365
        - Office 365
        - ...        
   - Syncs with on-premises AD via **sync service**

- **Network Security Group**
    - Filter traffic to inbound and from outbound Azure resources located in VNET
    - Filtering is controlled by roles 
    - Ability to have multiple inbound and outbound rules
 
- ** Application Security Group**
    - Allows grouping of virtual machines located in VNET
    - Designed to reduce the maintenance effort

- **Multi-Factor Authentication (MFA)**
    - Use more than one factor (evidence) to prove identity
    
- **Security Center**
    - Scan all azure resource security
    - Provides solutions and recommendations about security vulnerabilities
    - Natively embedded in Azure services
    - Integrated with Azure Advisor
    - Tiers
        - Free (Azure Defender OFF)
        - Paid (Azure Defender ON)
        
- **Azure Key Vault**
    - Managed service for storing sensitive information
    - Store keys, secrets and certificates
    - Access monitoring and logging

- **RBAC**
  - Role
  - Security principal
    - User
    - Group
    - Service principal
    - Managed identity
  - Scope: one or more azure resources that the access applies to
    
- **Resource Locks**
    - Designed to prevent accidental deletion and/or modification
    - Two types
        - Read-only: read actions are allowed
        - Delete: all actions are allowed except delete
    - Scopes are hierarchical (inherited)
    - Management Groups can't be locked
    - Only Owner and User Access Administrator roles can manage locks


- **User Defined Routes**
    - Create custom (user-defined, static) routes
    - Designed to override Azure default routing or add new routes
    - Managed via Azure Route Table resource
    - Associated with or more virtual network subnets
    
- **DDoS protection**
    - DDoS: multiple service are attacking
    - Designed to
        - Detect malicious traffic and block it while allowing legitimate users to connect
        - Prevent additional costs for auto-scaling environments
    - Two tiers
        - **Basic:** automatically enabled for Azure platform
        - **Standard:** additional mitigation & monitoring capabilities for Azure virtual network resources
    
- **Azure firewall**
    - Allow monitor and control incoming and outgoing traffic using rules
    - Managed service (PaaS)
    - Build-in high availability
    - Highly scalable
    - Support FQDN
    
- **Sharded Access Signature**
