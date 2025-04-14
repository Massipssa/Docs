## Encryption at rest
- Storage Service Encryption (SSE) with a 256-bit Advanced Encryption Standard (AES) cipher, and is FIPS 140-2 compliant

## Encryption at transit 
- It's done via HTTPS

## RBAC 
- Can be assigned to security principal and managed identities and data operations 

## Auditing 
- Can be done via Storage Analytics service.

## Keys 
- **Access Keys:** gives access to all resources in storage account
- **Shared access signature**: used for untrusted clients


- ACL are applied to the principals in the same tenant and they don't apply to users who use Shared Key or shared 
access signature (SAS) token authentication.

## Microsoft Defender for Storage
It provides an extra layer of security intelligence that detects unusual and potentially harmful attempts 
to access or exploit storage accounts.

## Query acceleration 