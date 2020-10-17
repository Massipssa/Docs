* **Data Defition Langauage (DDL)**

- Create: `create [table-name], 'CF1', 'CF2'`
- Alter
 - Alter cell number: `alter [table-name], NAME => 'CF', VERSIONS => number`
 - Delete column family: `alter [table-name], METHOD  => 'CF'`
 - Make readonly: `alter [table-name], READONLY(option)`
 - Table operators 
- Drop: `drop [table-name]`
- Drop all
- List: `list`
- Disable / Enabele: `disable [table-name]`
- Is_disabled: `is_disabled [table-name]`
- Describe: `describe [table-name]`
- Exists: `exists [table-name]`

```
create 'customer','address','order'
alter 'customer', NAME => 'f1', VERSIONS => 4
alter 'customer', 'delete' => 'f1'
drop 'customer'
describe 'customer'
disable 'customer'
enable 'customer'
exists 'customer'
```


* Put data : put ‘<table-name>’,’row-key’,’columnfamily:columnname’,’value’
	```put 'customer', 'john', 'address:state', 'paris'```
	```put 'customer','john','order:number','ORD-15'```
	
* Get data : **get table-name, row-key, column-family**
	* Get by row-key
		```get 'customer', 'john'```
	* Get by row-key and column-family
		```get 'customer', 'john', 'address'```

* **Data Manuipulation Langauage (DML)**

* Scan table
	 ```scan 'table_name'```
	
- Delete : **delete table-name, rowkey**
	delete 'customer', 'john'
	
- Count rows: 
	count 'customer'
	
- Delete table : 
	- disable 'customer'
	- drop 'customer' 
