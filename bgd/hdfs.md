* **Name node** 
	- Open, Close, Rename, Delete operations on files and directories 
	- Determines the mapping between blocks and databnode
* **Data Node**
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
	- Any action in FS is stored in edit log (delete file, change file replica number, ...) 

* **FsImage:** it stores
	- All FS namespace 
	- Mapping of blocks to files 
	- FS properties
	
* **Checkpoint:** 
	- Are occured 
		* After certain time periode (**dfs.namenode.checkpoint.period**) 
		* Give number of tansactions on FS have accumulated (**dfs.namenode.checkpoint.txns**) 
		
* **Re-replication:** it may occurs when
	- Datanode become unavailable 
	- Replica is corrupted 
	- Datanode hard disk fail 
	- Replication factor is decreased 
	
* **Trash** 
	- When files are deleted they are moved to ```/user/<username>/.Trash```
	- How to configure it **???**
	
* **Backup and checkpoint nodes** 
	- dfs.namenode.backup.address
	- dfs.namenode.backup.http-address

## HA
- Solve SPOF
- Two or more Namenodes
	- Active
	- StandBy
- To keep the state of the cluster synchronized, Namenodes use separate group of deamons called **JournalNodes** to read all edit logs from active Namenode	 

## HDFS Federation
- Uses multiple Namenodes/namespaces
- Namenodes are independantes and don't need coordination
- Datanodes are used as common storage for blocks by all Namenodes 

## Common problems
- Massive amount of small files in hdfs => More pressure on Namenode => Slow latency
- Hadoop and parquet don't support updates
