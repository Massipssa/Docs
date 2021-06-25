# Azure Active Directory

- **Identity:** think that get authenticated
    - User with username and pwd
    - Application or service using secret key or certificates
  
- Azure AD: is an identity provider
  - Centralize user management
  - Enable high security
  - Additional feature like MFA, Access List Control (ACL),... 

- **Managed identities**
  - **System-assigned**
    - Its lifecycle depends on Azure resource lifecycle (automatic management)
    - Cannot be shared with multiple resources
  - **User-assigned**
    - Its lifecycle is independent of any Azure resource lifecycle
    - Can be shared with other resources

![azure-ad](../screenshots/azure-ad.png)