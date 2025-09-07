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
- CloudTrail Logs have **SSE-S3 encryption** when placed into S3
- Control access to S3 using IAM, Bucket Policy, etc ...
- Near real-time intrusion detection

## Best practices

- Configure CloudTrail in all AWS accounts and Regions
- Set up separate trails for different use cases
- Enable MFA-delete and versioning on the Amazon S3 Bucket storing log files
- Enable CloudTrail log file integrity validation
- Encrypt CloudTrail log files at rest
- Use advanced event selectors with data events
- Integrate CloudTrail with Amazon CloudWatch Logs
- Use CloudTrail Insights to monitor anomalous API activity
- Use AWS Config rules to meet CloudTrail standards for the CIS AWS Foundations Benchmark controls

See https://aws.amazon.com/fr/blogs/mt/aws-cloudtrail-best-practices/
