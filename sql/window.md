# Window function


```sql
create table employee (employee_id id, full_name varchar(100), departement varchar(100), salary float);  

insert into employee values(100,'Mary Johns', 'SALES',	1000.00); 
insert into employee values(101,'Sean Moldy',	'IT', 1500.00);
insert into employee values(102,'Peter Dugan',	'SALES', 2000.00);
insert into employee values(103,'Lilian Penn',	'SALES', 1700.00);
insert into employee values(104,'Milton Kowarsky',	'IT', 1800.00);
insert into employee values(105,'Mareen Bisset', 'ACCOUNTS', 1200.00);
insert into employee values(106,'Airton Graue', 'ACCOUNTS', 1100.00);
commit;
```

## 1. Ranking Window

* Commun use is to find N top record based on some value
 
* **RANK():**
	* Get oreder with frame (partition) 
	* If two records have same rank (ex: rank = 3) the next rank will be 5 (rank 4 will be skipped)
	
```sql
SELECT
	RANK() OVER (PARTITION BY departement ORDER BY salary DESC) AS dept_ranking,
	departement, employee_id, full_name, salary
FROM employee; 
```

* **DENSE_RANK():**
	* Is identical as **RANK()** function except that it does not skip any rank

```sql
SELECT
	DENSE_RANK() OVER (PARTITION BY departement ORDER BY salary DESC) AS dept_ranking,
	departement, employee_id, full_name, salary
FROM employee;
```

* **ROW_NUMBER():**
	* Assign the number to each record
	* Can be used with or without **PARTITION BY**

```sql
SELECT
	ROW_NUMBER() OVER (ORDER BY salary DESC) AS dept_ranking,
	departement, employee_id, full_name, salary
FROM employee;
```	
	
## 2. Aggregate Window

```sql
-- SUM, AVG, MIN, MAX, COUNT
SELECT
	SUM(salary) OVER (PARTITION BY departement) AS total_salary,
	departement, employee_id, full_name, salary
FROM employee; 
```

https://www.sqlshack.com/use-window-functions-sql-server/