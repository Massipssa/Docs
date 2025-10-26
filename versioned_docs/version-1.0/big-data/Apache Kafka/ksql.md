# KSQL

- KsqlDB: streaming database
- Components:
  - ksqldb
  - ksqldb-server
  - ksql-cli
  
- Default port **8088**
- Run ksql-cli in docker ````docker exec -ti ksql-cli ksql http://ksql-server:8088````

- The result of an aggregate query is always a **Table**
- Supports exactly-once processing
- Accepts: SSL, SASL, ACLs managed by Kafka, Schema Registry
- Uses Admin Client, if topic auto creation is disableed and don't exist, Ksql will create the topic  

- **Metadata**
  - They are stroed internal topic
  - To secure them, we must secure the topic
- **Data Definition Langue (DDL):**
  - They write data to metedata
- **Data Manipulation Language (DML):** arn't available