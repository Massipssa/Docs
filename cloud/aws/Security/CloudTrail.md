# CloudTrail

- Provides governance, compliance and audit for you AWS Account
- Enabled by default
- Get a history of events / API calls made within your AWS Account by:
  - Console
  - SDK
  - CLI
  - AWS Services
- Can put logs from CloudTrail into CloudWatch Logs
- If a resource is deleted in AWS, look into CloudTrail first

- Only the past **90 days of activity**
- Default show only **Create, Modify or Delete** events
- Can:
  - Get a detailed list of all events you chose
  - Ability to store these events in S3 for further analysis
  - Can be region specific or global
- CloudTrail Logs have SSE-S3 encryption when placed into S3
- Control access to S3 using IAM, Bucket Policy, etc ...
