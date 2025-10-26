# Basics

## IAM

Apply policies that define **who** can do **what** on **which** resources.

The **who** part of an IAM policy can be:

- Google account
- Google group
- service account
- Cloud Identity domain

The **can do what** part of an IAM policy is defined by a **role**.

### Roles

A role is a collection of permissions.

- Primitive roles
  - Owner
  - Editor
  - Viewer
  - Billing Admin
- Predefinded roles (Managed by Google)
- Custom roles
  -  Can only be applied to either the project level or organization level. They can’t be applied to the folder level.

### Cloud Identity

- IDaaS (Identity as a Service)
- Origanilly from G-Suite
- Allows Single Sing On (SSO)
- Available identities:
  - Google account (managed account) or unmanaged account
  - Service acount
    - Used when you want authenticate machines to like VM to use other GCP services
  - Google Group, G-Suite Domain, Cloud Identity Domain

### Resources

- Project or Folders
- Cloud services (Pub/Sub, BigQuery, ...)
- Aspect of service (Topics, Datasets, Tables, ...)

## Cloud KMS

## Cloud IAP