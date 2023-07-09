# ELK

- Search engine 
- Analysis tool 
- Visualization tool (Kibana)
- A data pipeline (Beat / Logstash)
- Horizontally scalable

## ELK in AWS
- Fully manged service (but not serverless)
- Scale up or down without downtime **(But this isn't automatic)**
- Pay for use (instance-hours, storage, data transfer)
- Network isolation 
- AWS integration 
  - S3 buckets (via lambda to Kinesis)
  - Kinesis Data Streams 
  - DynamoDB Streams 
  - CloudWatch / CloudTrail 
  - Zone awareness
- **Cognito ??**
