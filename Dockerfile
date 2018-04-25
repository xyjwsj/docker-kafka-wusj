FROM anapsix/alpine-java

ARG kafka_version=1.1.0
#ARG kafka_version=0.10.2.1
ARG scala_version=2.12

MAINTAINER wusj

RUN apk add --update unzip wget curl docker jq coreutils

ENV KAFKA_VERSION=$kafka_version SCALA_VERSION=$scala_version
ADD download-kafka.sh /tmp/download-kafka.sh
RUN chmod a+x /tmp/download-kafka.sh \
            && sync \
            && /tmp/download-kafka.sh \
            && tar xfz /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt \
            && rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
            && ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka \
            && mkdir -p /var/kafka/log
            
EXPOSE 9092

WORKDIR /opt/kafka

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka
ENV PATH ${PATH}:${KAFKA_HOME}/bin
ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD server.properties /opt/kafka/config/server.properties
# The scripts need to have executable permission
RUN chmod a+x /usr/bin/start-kafka.sh
# Use "exec" form so that it runs as PID 1 (useful for graceful shutdown)
CMD ["start-kafka.sh"]
