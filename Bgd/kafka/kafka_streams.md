# Kafka streams 
 * Consume -> Process -> Produce 
 * Data stream: unbounded dataset (unfinite or ever growing) 
 * Envent streams features : 
	* They are ordred (card ex : put money, send, recover...) 
	* Immutable data record (ex: fincancial transaction can not be modfied) 
	* Are relayable 
	* Fault-tolerant 
 * Three paradigms : 
	* Request-Response (online trasaction processing OLAP) 
	* Bash-processing 
	* Stream-processing 
 * Concepts: 
 
	* Time
		- Event time: time where event occured. Kafka add automatically the current time to producer record 
		- Log append time: time event arrived to Kafka borker 
		- Processing time: 
			- Time at which sytem processing received data to perform some calculation 
			- Two threads of same application can have different processing time 
			- Higly unreliable and best avoided 
		PS: when usign time, time zone should be standrardied over the application 
		
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
	2- KafkaStream: execute object from topology. will start multiple threads,each applying the processing 
		topology to events in the stream
		
	* Stream: 
		- like topic, consists of one or many partitions 
	* We can run multiple app instances (with same application.id) 
	* Tolology: processing logic where: 
		- Node: stream processor 
		- Edge: stream 
	* State: 
		- Stateless: independent from the processing of the other message 
		- Stateful:

https://kafka-tutorials.confluent.io/changing-serialization-format/kstreams.html