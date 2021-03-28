
# Composer

- Fully managed service of ***Apache Airflow***
- Allows to: create, schedule and monitor a data workflow
- Composer = Airflow + Google Kubernetes Engine (GKE) + Cloud Storage
  
```python

from airflow import DAG
from airflow.operators import BashOperator
from datetime import datetime, timedelta

# 1 - declare defautl arguments
default_args = {
    'owner': 'massipssa',
    'depends_on_past': False,
    'start_date': datetime(2020, 6, 12),
    'email': ['kerrache.massipssa@gmail.com'],
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
