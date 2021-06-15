## Steps
1. Identify data sources
2. Determine the of data
3. Think about the solution


## ELK for monitoring
- Filebeat to collect logs
- Metricbeat for metrics
- Heartbeat for API testing (check either API is up or down)
- Elastic APM Java Agent for distributed tracing of the application 


## Workflow

1. Deploy ELK platform

2. Collect logs
    - Install Filebeat
        - Create three containers and install Filebeat on each of those containers 
        - Enable required modules (postgres, system and audit for need)
    - Run postgreSQL database inside docker container (create it using docker-compose)
    
3. Collect metrics
