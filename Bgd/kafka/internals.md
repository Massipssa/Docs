## How does Kafka maintains borkers ?

* Every broker has a unique **id** (set in config file or auto generated)

* **Leader**
    * Which followers are up-to-date

* **Controller**
     * Is responsible to elect partitons leader
     * The first broker that starts in cluster becomes the controller

### Replication
 * ***Leader replica:*** signle replica with leader node. Producers and consumers use this replica for read and write operations
 * ***Follower replica:*** used in case the leader craches
 
## Physical storage
* JBOD, RAID
* Unit storage is partition replica
* Partition cannot be split between disk
* Partition's size is limited by available size in disk
* ***log.dirs:*** file where partitions are stored
* Retention
    * Time or size

* Tool DumpLogSegment : allows to examine partition segement in filesystem 

    ```
        bin/kafka-run-class.sh kafka.tools.DumpLogSegments
    ```
