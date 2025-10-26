### DML
- Load data
  
    ```LOAD DATA LOCAL INPATH /path/local/file OVERWRITE INTO TABLE tablename```

- This command is useful if source table is partitioned

    ```
    INSERT OVERWRITE TABLE tablename1
    SELECT * FROM tablename2 t
    WHERE t.col1 = 'US' and t.col2 = 'OR'
    ```
- To avoid scanning table multiple time, use this syntax

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

- **Aggregation functions** 
    - count, sum, avg, ...
    - To improve aggregations queries performance ``set hive.map.aggr=true;``. Doing this the aggr will be done in 
    map phase, but it'll require more memory
        
- **Generating functions**
    - The inverse of aggregation function
    - it takes one column and explode it to multiple columns or rows
    - explode, json_tuple, ...
    
- **Join query optimization**
    - Put the large table at the end of the query (Hive will put the ones (small) in buffer and stream the last one) 
    - Add ``/*+STREAMTABLE(tablename)`` to the query
    - Map-side joins
    

- **Compression**
    - Minimize space storage
    - Reduce the overhead of disk and network I/O
    
    - Common techniques
        - GZip
        - Bzip2
        - Snappy
        - LZO
    
    - GZip and BZip2
        - Create small compressed output, but with the highest CPU overhead
        - Useful if disk space, and I/O overhead are concerns    
    - Snappy and LZo
        - Create larger file, but they are faster
        - Useful if space, and I/O overhead aren't more important than rapid decompression