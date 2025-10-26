# EventBridge

- Formerly CloudWatch Events
- Schedule: cron jobs
- Event Pattern: Event rules to react to a service doing somthing
- Trigger Lambda functions, send SQS/SNS messages...
- Type:
  - Default Event Bus
  - Partner Event Bus
  - Custom Event Bus
- Schema Registry
  - Can analyze the events in your bus and infer the schema
  - Allows you to generate code for your application, that will know in advance how data is structured in the event bus
  - Schemas can be versioned
- Resource-based Policy
  - Manage permissions for a specific Event Bus
