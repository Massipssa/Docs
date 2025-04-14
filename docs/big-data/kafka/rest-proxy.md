# REST Proxy

Allows to:
- Produce and consume messages
- View the state of the cluster
- Perform administrative operations (without using Kafka protocol)


## APIs examples

- Get all topics ```curl --silent  http://localhost:8082/topics | jq .```
