# EC2

## EBS Volume and Snapshot Encryption

- Encryption is disable by default
- Encryption can be enable for all EBS at EC2 settings
- Snapshot from encrypted volume is always encrypted
- Instance created from encrytpted AMI are also encrypted
- Encrytpion doesn't impact instance performance
- EBS Encryption
    - Data is encrypted ***at-rest*** and ***in-transit***

- **EBS-Optimization**
    - Separate Storage Path from Network Path