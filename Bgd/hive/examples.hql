SELECT  column_names
FROM    table_name;

-- Create table 
CREATE TABLE IF NOT EXISTS test_schema.emplyees (
    name STRING, 
    salary FLOAT, 
    subordinates ARRAY<STRING>, 
    deducations MAP<STRING, FLOAT>, 
    address STRUCT<street:STRING, city:STRING, state:STRING, zip:INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ''
COLLECTION ITEMS TERMINATED BY ''
MAP KEYS TERMINATED BY ''
LINES TERMINATED BY ''
STORED AS TEXTFILE;

---
CREATE DATABASE testdb LOCATION  '/root/test/hive'; 
WITH PROPERTIES ('creator' = 'massipssa', 'date' = '2020-04-11'); 