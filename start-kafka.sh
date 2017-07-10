#!/bin/sh

echo "broker.id=${BROKER_ID}" >> $KAFKA_HOME/config/server.properties
echo "listeners=${LISTENER_ADDR}" >> $KAFKA_HOME/config/server.properties
echo "zookeeper.connect=${ZOOKEEPER_CONNECT}" >> $KAFKA_HOME/config/server.properties
#advertised.listeners=PLAINTEXT://192.168.150.158:9092
echo "advertised.listeners=${ADVERTISED_LISTENER}" >> $KAFKA_HOME/config/server.properties

exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties start-foreground
