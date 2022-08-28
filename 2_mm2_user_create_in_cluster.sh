#!/bin/bash


USER_NAME=$1

[ -v $USER_NAME ] && { echo "Please provide username- which need access to topic?" ; exit 1 ; }

CMD="--bootstrap-server kafka4:9092,kafka5:9092,kafka6:9092 --add --allow-principal User:CN=$USER_NAME,OU=Devops,O=Devopsforall,L=Hyderabad,C=IN --operation All --topic=* --group=* --command-config /tmp/root.properties"

docker run --rm -it -v $(pwd):/tmp --network kafka_default --entrypoint /opt/bitnami/kafka/bin/kafka-acls.sh bitnami/kafka:3.1.0 $CMD
