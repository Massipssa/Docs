# Identity Access Management (IAM)

## Root account
- Has full access to all services
- The account must be secured (Use MFA to do it)

## Permission

- It's defined using JSON file
- Explicit deny overwrite Allow everywhere

## User

- Identity to be identified in AWS account
- Tow types access:
  - Programmatic
  - AWS management access
- Once new user is created => new url to login into the account will be generated

## Group

- Set of users

## Role
- Is an IAM entity that defines a set of permissions for making AWS service request
- Ex: give access to EC2 full access to S3

### Policy
- To assign a permission to a users, group, or resource we create a policy, which is a document which explicitly lists permissions (the actions)
- Identity based policy: attached to IAM user, group or role
- Resource based policy: attached to a resource

### Policy Types

- ***Managed***
  - Created by AWS
  - Read only
  - Useful when we need to assign them to many users
- ***Customer***
  - Created by the user
  - Are readable
  - Useful when we need to assign them to many users
- ***Inline***
  - Attached directly to the user
  - Useful for exception permissions

- **Principal**: an entity that can perform action or access a service 

## Credentials

- Account can be accessed using: User/PWD or Access Key (from cmd)
- STS (Security Token Service): allows to give temporary access between services

### Access Keys

- Allows programmatically access to AWS
- Contains
  - Access Key ID
  - Secret Access Key
- A user can have only ***two*** access key

### Multi-Factor Authentication

- User to turn it on, administrator can not enable it
- Administrator can restrict access for example to user that only have MFA


## Monitoring

- Access Analyzer: identify unintended access
- Credential Report: for auditing and compliance

## Best practices

- Create a strong password for your AWS resources
- Use a group email alias with your AWS account
- Enable multi-factor authentication
- Set up AWS IAM users, groups, and roles for daily account access
- Delete your account’s access keys
- Enable CloudTrail in all AWS regions