# Node

## Roles

- **Data**
	- Holds shards that contain indexed document
	- Perform CRUD operations, search and aggregations
	- Configured using ***node.data*** property
	- By default, all nodes are data nodes
	- They are, I/O and memory intensive
	- Must be monitored and add more data node if they are overloaded

- **Ingest node**
	- Pre-process a document defore it gets indexed
	- All nodes are ingest nodes by default
	- Configured using ***node.ingest*** property

- **Machine learing node**
	- Runs machine learning jobs
	- Handles ml API requests
	- Configured using ***node.ml*** property
- **Coordinating node**
