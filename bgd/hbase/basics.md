## Data Definition Language (DDL)

- Create: `create 'table-name', 'CF1', 'CF2'`
- Alter
    - Alter cell number: `alter 'table-name', NAME => 'CF', VERSIONS => number`
    - Delete column family: `alter 'table-name', METHOD  => 'CF'`
    - Make readonly: `alter 'table-name', READONLY(option)`
    - Table operators
- Drop: `drop 'table-name'`
- Drop all: `drop_all 'regex'`
- List: `list`
- Disable / Enable: `disable 'table-name'`
- Is_disabled: `is_disabled 'table-name'`
- Describe: `describe 'table-name'`
- Exists: `exists 'table-name'`

```
create 'customer','address','order'
alter 'customer', NAME => 'f1', VERSIONS => 4
alter 'customer', 'delete' => 'f1'
drop 'customer'
drop 'c*'
describe 'customer'
disable 'customer'
enable 'customer'
exists 'customer'
```

## Data Manipulation Language (DML)

* Put : `put 'table-name','row-key', 'columnfamily:columnname', 'value'`
* Get with rowkey : `get 'table-name', 'row-key'`
* Get with rowkey and column family: `get 'table-name', 'row-key', 'column-family'`
* Scan table: `scan 'table-name'`
* Delete : `delete 'table-name', rowkey`
* Count rows: `count 'table-name'`
* Count rows: `truncate 'table-name'`

```
put 'customer', '1', 'address:state', 'paris'
put 'customer', '1','order:number','ORD-15'
get 'customer', '1'
get 'customer', '1', 'address'
sacn 'customer'
delete 'customer', '1'
count 'customer'
truncate 'customer'
```