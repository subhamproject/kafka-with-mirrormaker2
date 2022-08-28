#!/bin/bash

KAFKA_TOPIC=$1

[ -v $KAFKA_TOPIC ] && { echo "Please provide kafka topic name you wish to describe?" ; exit 1 ; }


CMD="--describe --topic $KAFKA_TOPIC --bootstrap-server kafka4:9092,kafka5:9092,kafka6:9092 --command-config /tmp/root.properties"

docker run --rm -it -v $(pwd):/tmp --network kafka_default --entrypoint /opt/bitnami/kafka/bin/kafka-topics.sh bitnami/kafka:3.1.0 $CMD
