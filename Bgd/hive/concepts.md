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

