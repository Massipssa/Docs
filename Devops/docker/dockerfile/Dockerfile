# pull airflow 
FROM puckel/docker-airflow
LABEL Remarks="This is Apache Airflow image"
LABEL maintenair="kerrache.massipssa@gmail.com"

ENV DATA_BASE  /testdb 
ENV JAVA_HOME /usr/java

# Copy hello_dag to Aiflow dags folder 
COPY ./hello_dag.py dest

RUN ${JAVA_HOME} /path/to/jar 

EXPOSE 8080

VOLUME /home/massipssa/airflow/dags

WORKDIR ${DATA_BASE}

CMD ["airflow", "webserver"]

# will run script.sh 
ENTRYPOINT ["/path/to/script.sh", "param1", "param2"]
