## Concepts 
* Partitions of topic can be stored in differents servers (scaled horizontaly)
* Consumer read a message in order they arrive 
* **Broker:** 
    * Receives messages from Producer 
    * Assigns offsets to messages 
    * Commits messages to disk 
    * Responds to consumers with messages
* **Controller:** 
    * Elected automatically 
    * Reposible for administrative operations (Assign partitions to brokers and monitoring for broker failures)
* **Leader:** the owner of partition 
* **Retention:** 
    * Can be the number of days 
    * Or when topic reaches certain size in bytes  
    * Individual topic can have its own retention 
    * Topic can also be configured with ***log compacted*** that means Kafka will retains only ***the last*** messages with some keys 

## Consumer 

* The way to scale data consumption is by adding more consumer to consumer group 

### Partition reassignement
It happens when 
* New consumer is added to consumer group 
* Consumer shuts down or crashes 
* The topics the consumers are consuming is modified (e.g. administrator add new partition to topic)

### Configuration parameters 
* **auto.offset.reset** 
    * latest: is the default (records written after consumer were started)
    * earliest: read the data starting from the very beginning 

### Offset commit

* Kafka does not track acknowledgments from consumers the way many JMS queues do
* It allows consumers to use Kafka to track their position (offset) in each partition
* Consumer commit offset by producing a message to Kafka to topic __consumer_offsets

* Commit type
    * Auto commit 
    * 

livelock : application did not crash but fails to make progress for some reason 


## Offser Management




