# Zookeeper

* Enables coordination in distribued systems
* Main cluster state and notify any changes
* Needed to:
    * Manage configuration around the cluster
    * Have leader to perform updates, writes, ...
    * Lock resources
* Challenges of Distributed Applications
    * ***Race condition:*** two machines try to perfom a tache, which should be perfomed by one machine
    * ***Deadlock:*** two or more operations waiting other to complete
    * ***Inconsistency:*** partial failure of dta

## Components

- **Client:** sends heartbeats to inform server that is alive
- **Server:** sends acknowledgment  
- **Zookeeper ensemble:** set of servers. Minimum nodes required to form ansemble is 3
- **Leader:** recover failed nodes
- **Follower:** follows leader instructions

* Namespaces:
    * **Znode:** each node have **name** and **sequence of path** separated by (/)
    * **Config:** centralized configuration
    * **Workers:** userd for naming
* Data model
    * stat
        * Version number
        * ACL
        * Timestamp
        * Data length

### Znode

* Maintain a stats structure
* Can store data and have children at same time
* Stores informations (last version, transaction Id of laste transation, ...)
* Have ACL (create, write, read, delete and admin)
* Support authentication username / password
* Client can set **watcher** on znode to get notified when change occurs
    * data change
    * change an any znode
    * child znode created or deleted
    
* Types
    1. **Persistance:** pemanant znode they are only deleted manually (default)  
    2. **Emphemeral:** delete by Zookeeper when (-e flag to create)
         * Client who created it close the session
         * No request from client after timeout session (use by Kafka to maintain brokers)
    3. **Sequetiel:** same as emphemeral just Zoopkeeper assigns number of 10 digits during the creation and increment this number when other sequential is created (-s flag to create)
* Session: create between client and zookeeper
    * client sends heartbeats
    * Fail If no heartbeat was sent after certain period (timeout)
* Watchers: mecanism used by cleint to get changes in Zookeeper


## Config

* **server.X=hostname:peerPort:leaderPort**
    * **X:** should be integer
    * **hostname:** ip of the host
    * **peerPort:** port on wich ensemble comunicates
    * **leaderPort:** port used to elect leader
    * **clientPort:** port used to communicate with client  

* If leader goes down => followers store are notified and store the latest change in **cluster data storage**

### Commands

* **Create:** ``` create /znode_test "this is the data of the znode_test" ```
* **Get:** ``` get /znode_test ```
* **Create child:** ``` create /znode_test/child_1 "this is the data of chid_1" ```
* **Delete:** ``` delete /znode_test/child_1 ```
* **Get ACL:** ``` getAcl /znode_test ```

### Election

* Herd effet

https://medium.com/@bikas.katwal10/zookeeper-introduction-designing-a-distributed-system-using-zookeeper-and-java-7f1b108e236e