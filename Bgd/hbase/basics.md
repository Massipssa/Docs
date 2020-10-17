* **Data Defition Langauage (DDL)**

- Create table:
  
  `create [table-name], 'CF1', 'CF2'**`
	`create 'customer','address','order'`
			
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
