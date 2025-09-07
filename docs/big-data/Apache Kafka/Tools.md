## Kafka tools

* **kafka-topics.sh** : create, modify, delete and list the topics 

1. **create**

```
kafka-topics.sh --zookeeper host.zookeeper:2181 \
    --create \
    --topic topic-name \
    --replication-factor 3 \
    --partitions 8 \
    --if-not-exists \ # to avoid warn if topic exists
```

2. **alter (increase partitions number)**

```
kafka-topics.sh --zookeeper host.zookeeper:2181 \
    --alter \
    --topic topic-name \
    --partitions 16 \
```

3. **delete**

The option ***delete.topics.enable*** must be set to true in broker properties

```
kafka-topics.sh --zookeeper host.zookeeper:2181 \
    --delete \
    --topic topic-name
```

* **kafka-consumer-groups.sh**: lists and describes consumer groups

- For old groups, zookeeper is used to store them
- Newer topics are stored in the Broker

```
kafka-consumer-groups.sh --list --bootstrap-server kafka-server:9092
```

* **kafka-acls.sh**: add, remove or list ACLs

* **kafka-configs.sh**: set and override topic's configurations

- Topic config:

```
kafka-config.sh --zookeeper localhost:2181 \
    --alter \
    --entity-type topics \
    --entity-name <topic-name> \
    --add-config <key>=<value> [,<key>=<value>]
```