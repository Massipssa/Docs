## Concepts 
* Partitions of topic can be stored in differents servers (scaled horizontaly)
* Consumer read a message in order they arrive

* **Broker**
    * Knows all about topics and partitions metadatas
    * Is bootstrap broker
    * Stores some topics and partitions
    * Receives messages from Producer
    * Assigns offsets to messages
    * Commits messages to disk
    * Responds to consumers with messages

* **Controller:**
    * Elected automatically
    * Reposible for administrative operations (Assign partitions to brokers and monitoring for broker failures)

* **Leader:** the owner of partition

* **Partition**
    - Can not be deleted once is created
    - Order is garanteed within the partition, and once data is writed to partition is immutable


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
#### Consumer
* **auto.offset.reset** 
    * latest: is the default (records written after consumer were started)
    * earliest: read the data starting from the very beginning 
* **enable.auto.commit**: can be true or false. Allows Kafka to commit automatically the offset it had consumed 
#### Producer

### Offset commit

* Kafka does not track acknowledgments from consumers the way many JMS queues do
* It allows consumers to use Kafka to track their position (offset) in each partition
* Consumer commit offset by producing a message to Kafka to topic __consumer_offsets

* Commit type
    * Auto commit 
    * 

livelock : application did not crash but fails to make progress for some reason 


## Offset Management





## Links

http://lahotisolutions.blogspot.com/2019/03/apache-kafka-notes.html