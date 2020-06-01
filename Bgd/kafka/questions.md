* min.insync.replicas ?

* is KSQL ANSI SQL compliant ? 

* peek transformation ?

* unclean.leader.election.enable ?

Setting unclean.leader.election.enable to true means we allow out-of-sync replicas to become leaders, we will lose messages when this occurs, effectively losing credit card payments and making our customers very angry

* output of KStream-KTable join ? 

* max.tasks in kafka connect ? 

* exactly once guarantee ? 

* max.in.flight.requests.per.connection ?


* num.streams.threads ?


See the full list of errors and their "retriable" status here: https://kafka.apache.org/protocol#protocol_error_codes