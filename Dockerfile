FROM openjdk:9.0.4-12
RUN yum update -y \
    && yum install -y make

ENV SCALA_VERSION=2.11 \
    KAFKA_VERSION=1.1.0 \
    KAFKA_HOME="/usr/local/kafka" \
    KAFKA_DATA_DIR="/usr/local/data/kafka"

WORKDIR ${KAFKA_HOME}
RUN curl -sL http://apache.claz.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz | tar zxv
ENV PATH=${PATH}:${KAFKA_HOME}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/bin

EXPOSE 2181
COPY entrypoint.sh .
ENTRYPOINT [ "./entrypoint.sh" ]
