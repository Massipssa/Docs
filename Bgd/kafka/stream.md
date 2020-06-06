# Kafka streams

- **Record:** is key-value pair
- **Stream partitions**
- **Tasks**

 * Consume -> Process -> Produce
 * ***Data stream:*** unbounded dataset (unfinite or ever growing)
 * Envent streams features:
	* They are ordred (card ex : put money, send, recover...)
	* Immutable data record (ex: fincancial transaction can not be modfied)
	* Are relayable
	* Fault-tolerant
 * Three paradigms:
	* Request-Response (online trasaction processing OLAP)
	* Bash-processing
	* Stream-processing

## Concepts

### Time

- **Event time:** time where event occured. Kafka add automatically the current time to producer record
- **Log append time:** time event arrived to Kafka borker
- **Processing time:**
	- Time at which sytem processing received data to perform some calculation
	- Two threads of same application can have different processing time
	- Higly unreliable and best avoided
	- ***PS:*** when usign time, time zone should be standardized over the application

- **Time windows:** operations happen on slices of time

### State

- Information stored between events
- Can be Local or internal state: accesible only by steaming application instance
- External state (database, cache system,...)
	
* Design pattern
	- Single event processing
		
		
* Two APIs
	- Low level Processor
	- High Level Stream DSL
		
1- StreamBuilder: create topology (DAG), which is a serie of transformations
2- KafkaStream: execute object from topology. will start multiple threads,each applying the processing topology to events in the stream

* Stream:
	- Uunbouded, countinous real-time flow of records
	- Like topic, consists of one or many partitions

* Tolology: processing logic where
	- Node: Stream processor
	- Edge: stream

* **State:**
	- ***Stateless:***
		- Independent from the processing of the other message
		- Don't require state store
	- ***Stateful:***
		- Depends from other messages, its used when we need to join, aggregate or window input data
		- It requires state store

* **State Store**
	- State store are fault-tolerent, kafka will restore all state store prior to resuming
	- Used to store and query the data
		
* **KStream:**
	- Insert only

* **KTable:**
	- Upsert (insert and update it the record exists)
	- Key when value are **null**, those key are deleted
	- Read from a subset topic's partitions

* **GlobalKTable**
	- Upsert mode
	- Reads from all topic's partitions

- Stream application do not run inside the broker, it runs on the client JVM
- We can run many instances of an application
- **Processor topology:** the strategy which allows to compute data (is graph)


### Windowing
- Grace perdiod: indicates when the window result is final
- Out-of-order: if a record arrive after grace period (record.ts > window.end.time + grace.period) it'll discared and not processed

- **Window types** 
 - **Tumbling**
 - **Hopping**
 - **Sliding**
 - **Session**
  - Prime use area is user behavior analysis

### Processing grantee
- **At-least-once:** records are nerver lost but may be delivred
- **Exactly-once:**: records are processed only once



https://kafka-tutorials.confluent.io/changing-serialization-format/kstreams.html
