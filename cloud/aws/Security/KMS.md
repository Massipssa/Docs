## Key Management Service (KMS)

* Manages Key in AWS
* Fully managed 


## Cloud HSM

* KMS => AWS Manages software for encryption
* CloudHSM => AWS provisions encryption **hardware**
* Dedicated Hardware (HSM = Hardware Security Module)
* You manage your own encryption keys entirely (not AWS)
* The CloudHSM hardware device is tamper resistant
* FIPS 140-2 Level 3 compliance
* CloudHSM cluster are spread across mutli AZ (HA)
* Supports both **symmetric** and **asymmetric** encryption (SSL/TLS keys)
* No free tier available
* Must use the CloudHSM Client Software
