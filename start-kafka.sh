#!/bin/sh

KAFKA_CFG="$KAFKA_HOME/config/server.properties"

echo "broker.id=${BROKER_ID}" >> ${KAFKA_CFG}
echo "listeners=${LISTENER_ADDR}" >> ${KAFKA_CFG}
echo "advertised.listeners=${ADVERTISED_LISTENER}" >> ${KAFKA_CFG}
echo "zookeeper.connect=${ZOOKEEPER_CONNECT}" >> ${KAFKA_CFG}

exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
