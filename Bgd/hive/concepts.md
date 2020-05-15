# Hive

* Is data warehouse
* Uses HQL

## Serivces

1. **Hive**
2. **Metastore**
    * Stores metadata of tables and partitions  
    * Hive in **remote mode**:
        * Metastore use its own JVM process and other services communite with it using **Thrift API**
3. **HiveServer2**

### Tunning

* Memory configuration 
* GC limits 
* Partitions number limits 

### HA

* Configure loadbalancer for HiveServer2 
* Enable HA for metastore 

### Replication 

### Security 

1. **Authentication:** LDAP and Kerberos 
    * If Kerberos is not enabled no need to provide password when connecting using Beeline CLI 
2. **Authorization:** Ranger 
3. **Encryption** SASL QOP or SSL/TLS  

### About 

* Hive do not enforce schema on write, but it
* **hive.metastore.warehouse.dir** : default dir in hdfs where data is stored


- Types: 
 - Java types (int, string, float, ...)
 - Complexe types: Array, Map, Struct

### DDL

#### Table 
 - Can copy exsiting table schema with LIKE
 - Show: 
   - show tables in <namespace>
   - show tables 'emp*'
 - Describe: 
	- describe extended <tablename>
	- describe formated <tablename>
 - Describe column: 
 	- describe extended <tablename.columnname>

#### Partitions 

 - Strict and nonstrict mode to prohiby queries without where clause in partitioned tables

 - We can descirbe and show partitions
	-  show partitions <tablename>

 - We can Atler table by adding partition

- no support for insert, update and delete
- doesn't support transactions

### DML
- Load data
```LOAD DATA LOCAL INPATH /path/local/file OVERWRITE INTO TABLE tablename```

- This command is useful if source table is partionned

```
INSERT OVERWRITE TABLE tablename1
SELECT * FROM tablename2 t
WHERE t.col1 = 'US' and t.col2 = 'OR'
```
- To avoid scanning table multiple time, use this syntaxe

```
FROM tablename2 t
INSERT OVERWRITE TABLE tablename1
	PARTITION (country = 'US', state = 'OR') 
	SELECT * WHERE t.cntry = 'US' and t.st = 'OR'
```

- Hive support Dynamic Partition Inserts

- Create table and load in them in one query 

```
CREATE TABLE test
AS SELECT name, email 
FROM tablesource t
WHERE t.col = 'toto'
```

- Export data 

```INSERT OVERWRITE LOCAL DIRECTORY '/tmp/ca_employees'```
