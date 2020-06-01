# Connect


- When building data piplines:
    - Timeliness
    - Reliability

* Two types of connectors:
    * **Source connector:** push data to Kafka topic
    * **Sink connector:** pull data from kafka

* **Connector**
    * Define how data will be copied
    * They perform the copy of the data using ***jobs*** by breaking the job into a set of ***Tasks***
    * Source Connector
    * Sink Connector

    * Is reponsible for three things:
        - How many tasks to run for the connector
        - How to split data-copying between tasks
        - Getting configurations of tasks from the workers and pass it along

* **Tasks**
    - Responsible for getting data in and out of Kafka
    - They are initialized by receiving a context from the connector (Source or Sink context)

* **Workers**
    - They are the container process that execute connectors and tasks
    - Responsible for
        - Handle HTTP request and their configurations
        - Store connectors and tasks configurations
        - Start connectors and thier tasks and passing the appropriate configurations along
        - Commit offset for source and sink connectors
        - Handle retries when task fails

* **Converters**: convert data from kafka to source system
    - **JSON converter:** is part of Kafka
    - **Avro converter:** provided by Confluent Schema Registry


## Internal topics

    - connect-configs
    - connect-offset
    - connect-status

* Tool

- Connect version: ```curl http://localhost:8083/```
- Available connector pluging: ```curl http://localhost:8083/connector-plugins```
- All connectors: ```curl http://localhost:8083/connectors```