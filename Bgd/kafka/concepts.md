# Concepts

* Partitions of topic can be stored in differents servers (scaled horizontaly)
* Consumer read a message in order they arrive

## Broker

* Knows all about topics and partitions metadatas
* Is bootstrap broker
* Stores some topics and partitions
* Receives messages from Producer
* Assigns offsets to messages
* Commits messages to disk
* Responds to consumers with messages

## Controller

* Elected automatically
* Reponsible for administrative operations (Assign partitions to brokers and monitoring for broker failures)

## Leader

* The owner of partition

## Partition

* Can not be deleted once is created
* Order is garanteed within the partition, and once data is writed to partition is immutable
* Key used :
    - As additional information that gets stored with the message
    - To decide to which one of the topic partitions the message will be writen to. All the message with the same key will go to same partition

## Retention

* Can be the number of days
* Or when topic reaches certain size in bytes  
* Individual topic can have its own retention
* Topic can also be configured with ***log compacted*** that means Kafka will retains only ***the last*** messages with some keys

## Consumer

* The way to scale data consumption is by adding more consumer to consumer group
* **Coordinator group:** broker responsible to manage consumer of consumer group
    * To join coordinator group, the consumer sends ***JoinGroup*** request
    * The first consumer who joined the group become the ***leader*** of the group
    * The leader is responsible to assign partitions to consumer
    * Leader uses ***Range*** or ***RoundRobin*** policy to assign partition to the consumer

## Partition reassignement

* It happens when
    - New consumer is added to consumer group
    - Consumer shuts down or crashes
    - The topics the consumers are consuming is modified (e.g. administrator add new partition to topic)
* During rebalance a consuemer cannot consume, they should wait until rebalance is finished

## Configuration parameters

### Consumer

* **auto.offset.reset**
    * **latest:** is the default (records written after consumer were started)
    * **earliest:** read the data starting from the very beginning
* **enable.auto.commit**: can be true or false. Allows Kafka to commit automatically the offset it had consumed

### Producer

### Offset commit

* Kafka does not track acknowledgments from consumers the way many JMS queues do
* It allows consumers to use Kafka to track their position (offset) in each partition
* Consumer commit offset by producing a message to Kafka to topic **__consumer_offsets**

* Commit type
    * **Auto commit:** ```enable.auto.commit=true```
    * **Sync commit:**
        -  ```commitSync()``` API commit the last offset return by the ```poll()``` and throws an exception ```CommitedFailException``` if the commit fails for some reason
        - Drawback:
            - It blocks until the broker responds to the commit request
            - Will retry until the commit succeded or encounter  nonretriable error
    * **Async commit:**
        - ```commitSync()``` API  sends request and continue, don't wait for the broker response
        - It does not retry

livelock : application did not crash but fails to make progress for some reason

## Consuming strategies

- **At-most-once:** never duplicate messages, but can miss ones
- **At-last-once:** can duplicate messages but can't miss ones
- **Exactly-once:** deliver all messages without duplication

## Offset Management


## Links

http://lahotisolutions.blogspot.com/2019/03/apache-kafka-notes.html