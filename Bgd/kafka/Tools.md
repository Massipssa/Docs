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
* **kafka-consumer-groups.sh** : list and describe consumer groups 
```
kafka-consumer-groups.sh --list  --bootstrap-server kafka-server:9092

```

* **kafka-acls.sh**: add, remove or list ACLs
