* min.insync.replicas ?

* is KSQL ANSI SQL compliant ?

* peek transformation ?

* unclean.leader.election.enable ?

Setting unclean.leader.election.enable to true means we allow out-of-sync replicas to become leaders, we will lose messages when this occurs, effectively losing credit card payments and making our customers very angry

* output of KStream-KTable join ?

* max.tasks in kafka connect ?

- exactly once guarantee ?
  - Using idempotence and the transaction from producer side
  - isolation level from consumer side
    
* max.in.flight.requests.per.connection ?

## Stream

* num.streams.threads ?

* cleanup.policy ?

* num.standby.replicas ?


See the full list of errors and their "retriable" status here: https://kafka.apache.org/protocol#protocol_error_codes


- Why Kafka ?
  - No serialization and deserialization 
  - Zero copy

- Kafka is more than messaging system 
  - Publish / Subscribe mechanism 
  - Storage in distributed way (replication and data recovery)
  - Data processing 