
function start-kafka {
    # Start zoopkeeper
    ./bin/zookeeper-server-start.sh config/zookeeper.properties &
    sleep 10
    # Start kafka
    ./bin/kafka-server-start.sh config/server.properties &
}

#==== kafka-topic.sh ====

# Create topic
./kafka-topics.sh --zookeeper kmaster:2181 --create --topic demo --partitions 3 --replication-factor 3

# List all topics
./kafka-topics.sh --zookeeper localhost:2181 --list

# Describe all topics
./kafka-topics.sh --zookeeper localhost:2181 --describe --topic demo

# Delete topic
./kafka-topics.sh --zookeeper localhost:2181 --delete --topic demo


#==== kafka-config.sh ====

# Alter topic's config
./kafka-configs.sh --bootstrap-server localhost:2181 \
    --alter \
    --entity-type topics \
    --entity-name demo \
    --add-config retention.ms=3600000


# Describe override topic's config
./kafka-configs.sh --bootstrap-server localhost:9092 \
    --describe \
    --entity-type topics \
    --entity-name demo

# Delete overrided topic's config
./kafka-configs.sh --bootstrap-server localhost:9092 \
    --delete \
    --entity-type topics \
    --entity-name demo \
    --delete-config retention.ms


#==== kafka-console-producer.sh ====
./kafka-console-producer.sh --broker-list localhost:9092 --topic demo


#==== kafka-console-consumer.sh ====
./kafka-console-consumer.sh --bootstrap-server localhost:9092 \
    --topic demo \
    --from-beginning \
    --consumer.config /path/to/config.properties \
    --whitelist t* \ # all topics match the regex
    --blacklist m* # all topics excpets those match the regex