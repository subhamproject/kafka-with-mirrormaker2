#!/bin/bash

KAFKA_TOPIC=$1

[ -v $KAFKA_TOPIC ] && { echo "Please provide kafka topic name you wish to consume message from?" ; exit 1 ; }


CMD="--bootstrap-server kafka4:9092,kafka5:9092,kafka6:9092 --topic $KAFKA_TOPIC --from-beginning --consumer.config /tmp/consumer.properties"

docker run --rm -it -v $(pwd):/tmp --network kafka_default --entrypoint /opt/bitnami/kafka/bin/kafka-console-consumer.sh  bitnami/kafka:3.1.0 $CMD
