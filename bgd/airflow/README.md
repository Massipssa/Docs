# Hello word example in Apache Airflow

```python
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta

# [1. Define default args]
default_args = {
    'owner': 'massi',
    'depends_on_past': False,
    'start_date': datetime(2019, 10, 26),
    'email': ['kerrache.massipssa@gmail.com'],
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

# [2. Define dag args]
with DAG(
    'hello_dag',
    default_args=default_args,
    schedule_interval="2 * * * *"
) as dag:

    # [3. Define Dag's tasks]
    task_1 = BashOperator(
        task_id='task_1',
        bash_command='echo "Hello World from Task 1"',
        dag=dag)

    task_2 = BashOperator(
        task_id='task_2',
        bash_command='echo "Hello World from Task 2"',
        dag=dag)

    # [4. Set task dependencies]
    task_1 >> task_2

```
### Validate a DAG ###
Before running a DAG, execute your file to check if it contains errors. 
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
