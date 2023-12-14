* **Namenode** 
	- Open, Close, Rename, Delete operations on files and directories 
	- Determines the mapping between blocks and databnode
* **Datanode**
	- Read, Write
	- Block creation, replication and deletion
		
* **Replica selection:** in order to optimize bandwith and latency hdfs always read from the replica closest to reader 
	- If replica exist in the same **rack** read it 
	- if cluster is spans  on multiple data center read replica from local data center

* **SafeMode:** at start up Name node enter in safemode state (No replication is accepted at this state) 
	- Datanode sends Block report (list of data blocks that it holds) 
	- Block is said in safemode if the minimum block of replicas is checked by Namenode
	- Once all block are check Name Node exist the safemode state 
	- If any block doesn't satisfy the nombre of replica, Name node will replicate 
	
* **EditLog** 
	- Any action in FS is stored in edit log (delete a file, change file replica number, ...) 

* **FsImage:** it stores
	- All FS namespace 
	- Mapping of blocks to files 
	- FS properties
	
- **Checkpoint:** 
	- Are occurred 
		* After certain time period (**dfs.namenode.checkpoint.period**) 
		* Give number of the transactions on FS have accumulated (**dfs.namenode.checkpoint.txns**) 

- **Checksum**
	- When data is written or read
	- The datanodes are responsible for verifying the data they receive before storing the data and its checksum
	- HDFS run DataBlockScanner (n a background thread that periodically verifies all the blocks stored on the datanode)
	  This is to guard against corruption due to **bit rot** in the physical storage media 

- **Re-replication:** it may occur when
	- Datanode become unavailable 
	- Replica is corrupted 
	- Datanode hard disk fail 
	- Replication factor is decreased 
	
- **Trash** 
	- When files are deleted they are moved to ```/user/<username>/.Trash```
	- How to configure it **???**
	
- **Backup and checkpoint nodes** 
	- dfs.namenode.backup.address
	- dfs.namenode.backup.http-address


## Block
### Utility of blocks
- Estimate the size easily
- Separate metadata from file itself
- Allows replication for providing fault-tolerant and availability
- Insure against corrupted blocks and disk and machine failures
## Block caching
- cache directive
- cache pool 

## HA
- Solve Single Point Of Failure (SPOF) 
- Two or more Namenodes
	- Active
	- StandBy
- To keep the state of the cluster synchronized, Namenodes use separate group of daemons called **JournalNodes**
  to read all edit logs from active Namenode
- To set HA add options in **hdfs-site.xml**
- The number of JournalNodes must be at least 3  
- Minimum number of HA nodes is 2. It's suggested to not exceed 5 - with a recommended 3 NameNodes - due to communication overheads	 

## HDFS Federation
- Uses multiple Namenodes/namespaces
- Namenodes are independents and don't need coordination
- Datanodes are used as common storage for blocks by all Namenodes 

## Common problems
- A massive amount of small files in hdfs => More pressure on Namenode => Slow latency
- Split brain scenario  
- Hadoop and parquet don't support updates
