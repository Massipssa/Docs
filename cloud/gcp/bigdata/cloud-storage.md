# Cloud Stroage

- Is the essential storage service for working with data, especially unstructured data in the cloud
- Data is durable and strongly consistent
- Globally available
- Buckets are containers for Objects
- The metadata are used for purposes such as access control, compression, encryption, and lifecycle management
- We can set:
  - Rentention period
  - Versionning
  - Life cycle management

## Secure GCS

### Access

- IAM
  - It is set at the bucket level and applies uniform access rules to all objects within a bucket
  - Roles
    - Bucket Role Level
      - Reader
      - Writer
      - Owner
      - Set ACL policy
    - Project Role Level
      - Viewer
      - Editor
      - Owner
    - Custom Roles
- ACL
  - Can be applied at the bucket level or on individual objects, so it provides more fine-grained access control
  - Enabled by default

### Encyption

- Data encrypted at-rest and transit
- No way de disabled encryption
- GMEK (Google Managed Encryption Keys)
  - Is done by Google using encryption keys that we manage, Google-managed encryption keys, or GMEK
  - Hapens in two levels
    - First, the data is encrypted using a data encryption key
    - Then the data encryption key itself is encrypted using a key encryption key, or KEK

- CMEK (Customer Managed Encryption Keys)
  - You control the creation and the existence of the KEK in Cloud KMS
- CSEK (Customer Supplied Encryption Keys)
  - You provid the KEK key

## Data locking

- For audit purposes, you can place a hold on an object, and all operations that could change or delete the object are suspended until the hold is released