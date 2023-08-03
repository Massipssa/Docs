# Pub/Sub

- Distributed messagin service
- Serverless
- Global scale message buffer/coupler
- No-ops, global availability and auto-scaling
- Decouple sender and receiver
- Guarantee **At-last-once** delivery
- Asynchronous messaging (ex: many-to-many) or other combination
- Message are stored in **Message Storage**
- Ensure end-to-end encryption
- Kafka Connect can be useb to link PubSub to Kafka
- Supports many inputs and outputs

<div style="text-align:center"><img src=/gcp/screenshots/pubsub/archi.png/></div>


## Commands

- Pull: ```gcloud pubsub subscriptions pull sub-name --auto-ack```

## IAM
