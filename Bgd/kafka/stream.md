# Kafka streams

- **Record:** is key-value pair


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
 
* Time
	- Event time: time where event occured. Kafka add automatically the current time to producer record
	- Log append time: time event arrived to Kafka borker
	- Processing time:
		- Time at which sytem processing received data to perform some calculation
		- Two threads of same application can have different processing time
		- Higly unreliable and best avoided
	- PS: when usign time, time zone should be standrardied over the application
		
* State: information stored between events
	- Local or internal state : accesible only by steaming app instance
	- External state
* Time windows: operations happens on slices of time
	
* Design pattern
	- Single event processing
		
		
* Two API
	- Low level Processor
	- High Level Stream DSL
		
1- StreamBuilder: create topology (DAG) is serie of transformations
2- KafkaStream: execute object from topology. will start multiple threads,each applying the processing topology to events in the stream

* Stream:
	- Uunbouded, countinous real-time flow of records
	- Like topic, consists of one or many partitions

* Tolology: processing logic where
	- Node: Stream processor
	- Edge: stream

* **State:**
	- ***Stateless:*** independent from the processing of the other message
	- ***Stateful:*** dependent from other messages, its used when we need to join, aggregate or window input data

* **KStream:** insert only
* **KTable:** upsert (insert and update it the record exists)

- Stream application do not run inside the broker, it runs on the client JVM
- We can run many instances of an application
- **Processor topology:** the strategy which allows to compute data (is graph)



https://kafka-tutorials.confluent.io/changing-serialization-format/kstreams.html