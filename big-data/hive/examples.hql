SELECT  column_names
FROM    table_name;

-- Create table 
CREATE TABLE IF NOT EXISTS test_schema.employees (
    name STRING, 
    salary FLOAT, 
    subordinates ARRAY<STRING>, 
    deductions MAP<STRING, FLOAT>,
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



# DDL

#----------------------------------------
# Create external table
#----------------------------------------
create external table logs_messages (
    hms int,
    severity string,
    server string,
    process_id int,
    message string)
    partitioned by (year int, month int, day int)
    ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

#----------------------------------------
# rename table
#----------------------------------------
alter table logs_messages rename to logsmsgs;

#----------------------------------------
# change column name, type and position
#----------------------------------------
alter table logs_messages
change column hms hours_minutes_seconds int
comment 'Column comment'
after severity;

#----------------------------------------
# Partition
#----------------------------------------

# Add partition
alter table logs_messages add if not exists
partition(year=2020, month=1, day=1)
location "/tmp/hive/logs/2020/1/1";

# change location
alter table logs_messages partition(year=2020, month=1, day=1)
set location "/tmp/hive_test/logs/2020/1/1";

# Drop partition
alter table logs_messages drop if exists partition(year=2020, month=1, day=1);


## DML

insert into employees values("test4", 200, array("one", "two", "three"),
 named_struct('street','street1', 'city','city1', 'state','state1', 'zip', 20),
 map('toto', float(0)), "algeria", "alger");

