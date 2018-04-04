#!/bin/bash

set -o m

cd /usr/local/kafka/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
bin/zookeeper-server-start.sh config/zookeeper.properties &
ZOOKEEPER_PID=$!
bin/kafka-server-start.sh config/server.properties &
KAFKA_PID=$!

bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
bin/kafka-topics.sh --list --zookeeper localhost:2181

