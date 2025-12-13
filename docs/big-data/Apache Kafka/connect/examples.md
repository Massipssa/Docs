# File connector example

## Post FileSourceConnector

```json
curl -X POST http://localhost:8083/connectors --header "content-Type:application/json" -d '
{
    "name":"source-file-config",
    "config":{
        "connector.class":"FileStreamSourceConnector",
        "file":"/etc/kafka/server.properties",
        "topic":"kafka-connect-topic"
    }
}'
```

## Post FileSinkConnector

```json
curl -X POST http://localhost:8083/connectors --header "content-Type:application/json" -d '
{
  "name": "sink-file-config",
  "config": {
    "connector.class": "FileStreamSinkConnector",
    "file": "/sink_kafka.txt",
    "topics": "kafka-connect-topic"
  }
}'
```

## Get avaiblable connectors

```curl http://localhost:8083/connectors```

## Delete connector

```curl -X DELETE http://localhost:8083/connectors/source-file-config```
```curl -X DELETE http://localhost:8083/connectors/sink-file-config```

### Common erros with JDBC connector

- Wrong connection string
- Diver not available in classpath
- Permissions to read the table
