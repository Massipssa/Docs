
- Add exporter to prometheus

JAR_PATH=/home/massi/monitoring/jars/jmx_prometheus_javaagent-0.12.0.jar
EXPORTER=/home/massi/monitoring/kafka.yml
export KAFKA_OPTS="$KAFKA_OPTS -javaagent:$JAR_PATH=7071:$EXPORTER"