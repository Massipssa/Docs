- Azure Identity Service
    - Identity:
        - User
        - App or Server
        
- **Azure AD**
    - Manages identity and access to resources
    - To manage AD the **Global administrator** role is required
    - Used by multiple Microsoft cloud platforms
        - Azure
        - Microsoft 365
        - Office 365
        - ...        
   - Syncs with on-premises AD via **sync service**
   
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
