#!/bin/sh

echo "${BROKER_ID}" >> $KAFKA_HOME/config/server.properties
echo "${LISTENER_ADDR}" >> $KAFKA_HOME/config/server.properties
echo "${ZOOKEEPER_CONNECT}" >> $KAFKA_HOME/config/server.properties

exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
