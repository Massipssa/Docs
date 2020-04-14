## How does Kafka maintains borkers 

* Every broker has a unique **id** (set in config file or auto generated) 

* Leader: 
    * Which follower is up-to-date

* Controller: 
     * Is responsible to for electing partitons leader 
     * The first broker that starts in cluster becomes the controller 

### Replication
 * Leader replica: signle replica with leader node. Producers and consumers use this replica
 * Follower replica: used in case the leader craches 
 

## Physical storage
* JBOD, RAID
* Unit storage is patition replica 
* Cannot be split between disk
* Size is limited by available size in disk 
* log.dirs: file where partitions are stored 
* Retention 
    * Time or size 

* Tool DumpLogSegment : allows to examine partition segement in filesystem 

    ```
        bin/kafka-run-class.sh kafka.tools.DumpLogSegments
    ```