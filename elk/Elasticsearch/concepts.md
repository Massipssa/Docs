## Componenets

- Index: virtual namespace which points to shard. It is similar to BD
	- Is created automtically if not exists (Diasable the option in prod mode)
- Mapping: schema
- Type => table
- Document: une entée dans le type
	- A document is indexed into an index
	- Doc is update if we put new one with same ID (overwrites new one) (201 http status)
	- **_create:** endpoint to avoid overwriting existing document (409 http status)
	- **_update:** to update filed in document
	- **_mget:** get multiple documents in a single request
	
- **Node:** is an instance of ES
	- A java process that runs in JVM
	- Has a unique ID (randomly generated UUID)
	- Has a name (default is hostname)
		- Can be set in .yml file
		- or ```./bin/elasticsearch -E node.name=name_node```
- **Cluster:**
	- Is one or multiple nodes working together in distributed mode
	- Has a name (default elasticsearch)
		- Can be set in .yml file
		- or ```./bin/elasticsearch -E cluster.name=name_cluster```
- **Shard:** is worker unit that holds data and can be assigned to nodes
	- ***Primary:*** original shard of the index
	- ***Replica:*** copy of the primary shard
	- The primary and replica are always in different nodes

- **Replicas**

Archi  
 - bin 
 - config
 - data : indexed data in ES
 - jdk
 - lib
 - logs
 - modules
 - plugins : each plugin is contained in a subdirectory 


Run as deamon : 
```
./bin/ealasticsearch/ -d -p elastic.pid 
```

## Search

- ***Queries:*** the query cluases to matche documents
- ***Aggregations:*** the aggregation clauses to summarize data

- **```track_total_hits: true```**: count more than 10,000 hints (in ELK > 7.0 hint is limeted to 10,000)

### Hints

In case of queries

- Limited to 10 docs
- total is limited to 10000 after >= 7.0 ELK version
- track_total_hints can be used to get total value
- hits are stored by **_score** and each hit has _score


### Aggregation type: 
* Metrics 
* Buckets: collection of docs that share  a common criteria

## Mapping

Can be:
- Define at the creation
- Added to exiting index

### Inverted index

- Make searching fast

### Doc values

- Allows to perform aggregations and sort

### Optimize mapping

- Disable inverted index
	- Field available for quring but not for aggregation
	- ```"index": false```
- Disable a doc values
	- Field  **not** available for quring but available for aggregation and sort
	-  ```"doc_values": false```
- Disable field
	- Cannot query or aggregate this field
	- ```"enabled": false```
- Disable an object ```"enabled": false```

### Dynamic template

- Make it easier to set up your own mappings by defining defaults for fields, based on their JSON type, name or path


## Write operation

## Search operation

- **Query Phase**
	- Broadcast search query to all nodes
	- Each node return doc IDs and sort values
- **Fetch Phase**

## Performance issues

- Profile a query ```"profile": true```
- Use task API  ```GET _task``` to view task properties
- Debug thread pool and hot thread ```GET _nodes/thread_pool```, ```GET _nodes/hot_threads```
- Check for sespending tasks ```GET _cluster/pending_tasks```
- Circuit breakers

https://www.elastic.co/guide/index.html  
https://logz.io/blog/elasticsearch-tutorial/

