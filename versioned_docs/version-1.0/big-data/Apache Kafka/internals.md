## Record

It consists of three parts:

- Key
- Value
- Timestamp

Default size is 1 MB

## Broker

- Every broker has a unique **id** (set in config file or auto generated)
- Broker's metadata are stored within zookeeper in the znode **/brokers/ids/broker-id**
- If the broker is gone its ID will still exist in other data structure. Like this, if we replace the broker
  with another one having the same ID, it'll immediately join the cluster and with same partitions and topics assigned to it

## Controller

- Is responsible to elect partitions leader
- The first broker that starts in cluster becomes the controller
- It creates ephemeral node **/controller** in zookeeper

## Replication

- ***Leader replica:*** single replica with leader node
  - Producers and consumers use this replica for read and write operations
  - Responsible for knowing which followers are up-to-date with the leader

- ***Follower replica:***
  - Used in case the leader craches
  - Replicate messages from the leader
  - Stay up-to-date with the recent message
  - It may be **in sync** or **out of sync**
  - Only **in sync** followers are eligible to become leader in case of crach
  - **replica.lag.time.max.ms** the amout of time after which the follower is considered in **out of sync**

- **Preferred Leader**
  - The replica that was the leader of the partition when the topic was originally created
  - **auto.leader.rebalance.enable=true** will check if the current leader is not the preferred leader but it's **in sync** and trigger the leader election to make the preferred leader the current leader

## Request processing

- **Metadata request**
  - Sent by client with the list of topics in which is interested
  - Can be sent to any broker
  - Server will respond with:
    - List of partitions the topic contains
    - List of replicas for each partition
    - Leader replica for each partition
  - Client will cache the information
  - **metadata.cache.max.ms** refresh interval of the metadata in the cache

- **Produce request**
After receiving the request, the lead replica will:

- Check if the user who trying to write has the required privileges
- The **acks** is valid (0, 1 or all)
- If acks=all, is there enough **in sync** replicas

## Fetch request

- It's important to set the limit of the data the consumer can handle per partition, because large amount of data can lead to out of memory problems
- **zero copy** send data directly from the filesystem to network channel without any intermediate buffers
- Set upper and lower bound of data to read, is greate way to reduce CPU and network utilization

## Physical storage

- JBOD, RAID
- Unit storage is partition replica
- Partition cannot be split between disk
- Partition's size is limited by available size in disk
- ***log.dirs:*** file where partitions are stored
- Retention
  - Time or size

## File format

- The format is the same used by producer ``<->`` borker and broker ``<->`` consumer. This avoid any compression and decompression and allows the zero copy optimization
- File contains
  - Key, value and offset of the message
  - Message size
  - Magic byte:  indicates the version of the message format
  - Codec compression (Snappy, GZip, LZ4)
- Tool DumpLogSegment : allows to examine partition segement in filesystem
    ```./bin/kafka-run-class.sh kafka.tools.DumpLogSegments```

## Index

- Maps offset to segment files and position within the file
- They are broken into segments , they can be deleted when messages are purged
- Partition has **one** segment and **two** indexes files

## Compaction

- Keep only the latest message value
- If the key of message is **null** the compaction will fail
- Message having null values are **deleted**
