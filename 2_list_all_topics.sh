#!/bin/bash


CMD="--list --bootstrap-server kafka4:9092,kafka5:9092,kafka6:9092 --command-config /tmp/root.properties"

printf "Following are the list of topics in kafka cluster.."
echo " OK!"
echo "------------------------------------------------------------"
docker run --rm -it -v $(pwd):/tmp --network kafka_default --entrypoint /opt/bitnami/kafka/bin/kafka-topics.sh bitnami/kafka:3.1.0 $CMD
