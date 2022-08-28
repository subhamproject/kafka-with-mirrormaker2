#!/bin/bash


CMD="/tmp/mm2.properties"

docker run --rm -it -v $(pwd):/tmp --network kafka_default --entrypoint /opt/bitnami/kafka/bin/connect-mirror-maker.sh bitnami/kafka:3.1.0 $CMD

