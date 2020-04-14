## Componenets
- Index:  BD 
	- Is created automtically if not exists (Diasable the option in prod mode) 
- Mapping: schema 
- Type => table 
- Document: une entée dans le type 
	- A document is indexed into an index 
	- Doc is update if we put new one with same ID (overwrites new one) (201 http status) 
	- **_create** endpoint to avoid overwriting existing document (409 http status) 
	- **_update** to update filed in document 
	- **_mget** get multiple documents in a single request 
	
- Node : is an instance of ES
	- A java process that runs in JVM 
	- Has a unique ID (randomly generated UUID) 
	- Has a name (default is hostname)
		- Can be set in .yml file 
		- or ```./bin/elasticsearch -E node.name=name_node```
- Shard => 
- Replicas 
- Cluster: 
	- Is one or multiple nodes working together in distributed mode 
	- Every node belongs to signle node 
	- Has a name (default elasticsearch) 
		- Can be set in .yml file 
		- or ```./bin/elasticsearch -E cluster.name=name_cluster```
		
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

## Hints 
	- Limited to 10 docs 
	- total is limited to 10000 after >= 7.0 ELK version 
	- track_total_hints can be used to get total value 
	- hits are stored by **_score** and each hit has _score 

https://www.elastic.co/guide/index.html  
https://logz.io/blog/elasticsearch-tutorial/


#### ----------------------------------- Logstash -----------------------------------
https://logz.io/blog/logstash-tutorial/
https://logz.io/blog/logstash-pipelines/ 

 - input plugins : pull data using 
 - filter plugins : transform data 
 - output plugins : push data 

 
 
## Questions 
	- What are the three main configuration files you will find in the Elasticsearch config folder?
		- elasticsearch.yml 
		- jvm.options 
		- log4j2.properties 
	- The only way to configure settings is using the config files => False (can user command line with the option -E)
	- How do you set the node name 
		- using .yml file node.name=name
		- -E node.name=name_node