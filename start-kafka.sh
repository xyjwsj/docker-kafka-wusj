#!/bin/sh

KAFKA_CFG="$KAFKA_HOME/config/server.properties"

echo "broker.id=${BROKER_ID}" >> ${KAFKA_CFG}
# echo "listeners=PLAINTEXT://${LISTENER_ADDR}" >> ${KAFKA_CFG}
# echo "advertised.listeners=PLAINTEXT://${ADVERTISED_LISTENER}" >> ${KAFKA_CFG}
echo "advertised.host.name=${ADVERTISED_HOST}" >> ${KAFKA_CFG}
echo "advertised.port=${ADVERTISED_PORT}" >> ${KAFKA_CFG}

echo "zookeeper.connect=${ZOOKEEPER_CONNECT}" >> ${KAFKA_CFG}

echo "broker.list=${BROKER_LIST}" >> ${KAFKA_CFG}

exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
