# IAM 

- Admin
- Authentication
  - Who are you ? 
  - It uses
    - Know: based on something you know (password)
    - Have: something you have 
    - Are: for instance if the device belong to you
    - MFA (Multi-Factor Authentication): combines Have + Are
- Authorization
  - Use PAM with high privileges uses (sysroot, dba, ...)  
- Audit
  - Abnormal actions should be detected (making transaction in a new way, updating password, ...) 
  - Tools to use
    - User Behavior Analytics
    - User Entity Analytics