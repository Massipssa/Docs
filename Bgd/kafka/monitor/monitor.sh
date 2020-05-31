
JAR_PATH=/home/massi/monitoring/jars/jmx_prometheus_javaagent-0.12.0.jar
EXPORTER=/home/massi/monitoring/exporter/kafka.yml
KAFKA_HOME=/home/massi/kafka

# Restart Kafka
echo "Stop Kafka ..."
$KAFKA_HOME/bin/kafka-server-stop.sh
sleep 10

export KAFKA_OPTS="$KAFKA_OPTS -javaagent:$JAR_PATH=7071:$EXPORTER"

echo "Start Kafka ..." 
nohup $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties &
