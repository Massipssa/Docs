# Pub/Sub

- Global scale message buffer/coupler
- No-ops, globaly availabilityn auto-scaling
- Decouple sender and receiver
- Garantee **At-last-once**
- Asynchrounous messaging (ex: many-to-many) or other combinaison
- Message are stored in **Message Storage**
- Kafka Connect can be useb to link PubSub to Kafka


<div style="text-align:center"><img src=/gcp/screenshots/pubsub/archi.png/></div>


## Commands

- Pull: ```gcloud pubsub subscriptions pull sub-name --auto-ack```

## IAM