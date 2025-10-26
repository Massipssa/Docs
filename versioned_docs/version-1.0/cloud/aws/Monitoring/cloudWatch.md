# CloudWatch

- Monitoring and observability platform
- Metrics
  - Default
  - Custom

## System metrics

- They are metrics that you get  out iof the box. The more managed the service is, the more you get.

## Application metrics

- By installing the CloudWatch agent, you can get information from inside your EC2 instances

## Alarms

## CloudWatch Logs

- **Log Group:** a collection of log steam
- **Log Stream:** a collection of log events from the same source create a log stream
- **Log Event:** the record of what happened. It contains a timestamp and the data
- Logs can be streamed to
  - S3
  - Kinesis Data Stream
  - Kinesis Firehose
  - AWS Lambda
- Logs are encrypted by default and custom encryption keys can be applied
