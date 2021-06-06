# Hello word example in Apache Airflow #

```python
from airflow import DAG
from airflow.operators import BashOperator
from datetime import datetime, timedelta

# 1 - declare defautl arguments
default_args = {
    'owner': 'massi',
    'depends_on_past': False,
    'start_date': datetime(2019, 10, 26),
    'email': ['massipssa.kerrache@gmail.com'],
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

# 2 - define a DAG
dag = DAG('helloworld_dag', default_args=default_args)

# 3 - define DAG's tasks 
task_1 = BashOperator(
    task_id='task_1',
    bash_command='echo "Hello World from Task 1"',
    dag=dag)

task_1 = BashOperator(
    task_id='task_2',
    bash_command='echo "Hello World from Task 2"',
    dag=dag)

# 4 - set task dependencies    
task_1 >> task_2 

```
### Validate a DAG ###
Before running a DAG, one have to execute 
```bash 
python helloworld_dag.py
```
### Test task ###
```bash 
airflow test helloworld_dag task_1 2019-10-26
```

# Airflow in distributed mode #


1.   Scheduler creates new task instance in metadata store with status SCHEDULED  
2.   Scheduler uses Celery Executor to send a task to messages broker (RabbitMQ) 
3.   The Cerely worker receives the command from the queue
4.   The Cerely worker updates the status of task in metadata store to RUNNING
5.   The Cerely worker executes task command
6.   Once the task is finished, the celery worker updates the metadata to set the status of the task instance to SUCCESS


![picture alt](https://images.ctfassets.net/be04ylp8y0qc/7jm5tFBkD8LmnQmdmkzvZa/3e17809a19f11ee8efbcc87a0a6b389b/1_avBjYUY6ZtfEyTkk7FI8JQ.png?fm=webp "Airflow")

For more info see  [How Apache Airflow Distributes Jobs on Celery workers](https://www.sicara.ai/blog/2019-04-08-apache-airflow-celery-workers/)

* **Celery:** task queue 
