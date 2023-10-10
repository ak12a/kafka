FROM openjdk:11-jre-slim 

ARG KAFKA_VERSION=3.3.2 
ARG SCALA_VERSION=2.13 

WORKDIR /opt/kafka

RUN apt-get update  && apt-get install -y netcat wget && \
    wget  https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    tar -xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} kafka && \
    rm -rf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz 

ENV PATH=$PATH:/opt/kafka/bin

CMD ["bin/kafka-server-start.sh", "config/server.properties"]
