FROM openjdk:11-jre-slim 

ARG KAFKA_VERSION=3.3.2 
ARG SCALA_VERSION=2.13 

WORKDIR /opt/

RUN apt-get update  && apt-get install -y netcat wget && \
    wget  https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    tar -xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} kafka && \
    rm -rf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz 

ENV PATH=$PATH:/opt/kafka/bin

COPY connect-mirror-maker.properties /opt/kafka/config 
# COPY runMirrorMaker.sh /opt/kafka/bin


CMD [ "/bin/connect-mirror-maker.sh",  "/config/connect-mirror-maker.properties" ]
# ENTRYPOINT [ "/opt/kafka/bin/runMirrorMaker.sh" ]
