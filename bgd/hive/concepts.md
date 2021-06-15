# Hive

* Is data warehouse
* Uses HQL

## Services

1. **Hive**
2. **Metastore**
    * Stores metadata of tables and partitions  
    * Hive in **remote mode**:
        * Metastore use its own JVM process and other services communite with it using **Thrift API**
3. **HiveServer2**

### Tuning

* Memory configuration 
* GC limits 
* Partitions number limits 

### HA

* Configure load balancer for HiveServer2 
* Enable HA for metastore 

### Replication 

### Security 

1. **Authentication:** LDAP and Kerberos 
    * If Kerberos is not enabled no need to provide password when connecting using Beeline CLI 
2. **Authorization:** Ranger 
3. **Encryption** SASL QOP or SSL/TLS  

### About 

* Hive do not enforce schema on write, but it

### hive-site.xml
* **hive.metastore.warehouse.dir** : default dir in hdfs where data is stored
* Metastore 
 - Driver: **javax.jdo.option.ConnectionDriverName**
 - Password: **javax.jdo.option.ConnectionPassword**
 - Url: **javax.jdo.option.ConnectionURL**
 
 ### core-site.xml



## Data Model 


### Table

- Show
    - ``show tables in <namespace>``
    - ``show tables 'emp*'``
- Describe
    - ``describe extended <tablename>``
	- ``describe formatted <tablename>``
 - Describe column 
 	- ``describe extended <tablename.columnname>``
    
- **Internal (managed)**
    - Data stored in default location
    - The data is dropped when the table is dropped
- **External**
    - Location is not the default one
    - Dropping table will not drop data, although table's metadata will be dropped
    
### Partition 

- **strict:** prohibit queries without where clause in partitioned tables 
  **nonstrict:** allow running queries without where clause
  ``set hive.mapred.mode=strict;``
  
- We can describe and show partitions
    -  ``show partitions <tablename>``
    - ``show partitions <tablename> PARTITION(col_name='value')``
- We can alter table by adding partition
- no support for insert, update and delete
- doesn't support transactions

  ````sql
    Create table if not exists mydb.employee(
        name string,
        salary float,
        adgress struct<street: string, city: string, state: string, zip: int> 
    )
    PARTITIONED BY (country string, state string);
    ````
  
    - Load data from file to partitioned table
    ```
    LOAD DATA LOCAL INPATH '${env:HOME}/path/to/dir'
    INTO TABLE employees
    PARTITION (col_part_name1 = 'value1', col_part_name2 = 'value2');
    ```
### Bucket

- Each bucket is stored as file in partition directory

### Types
- Java types (int, string, float, ...)
- Complex types: Array, Map, Struct






