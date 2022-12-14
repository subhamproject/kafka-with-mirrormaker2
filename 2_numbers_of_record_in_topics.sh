#!/bin/bash


KAFKA_TOPIC=$1

[ -v $KAFKA_TOPIC ] && { echo "Please provide kafka topic name you wish to create?" ; exit 1 ; }

CMD_1="kafka.tools.GetOffsetShell --bootstrap-server kafka4:9092,kafka5:9092,kafka6:9092 --command-config /tmp/root.properties --topic $KAFKA_TOPIC --time -1"
CMD_2="kafka.tools.GetOffsetShell --bootstrap-server kafka4:9092,kafka5:9092,kafka6:9092 --command-config /tmp/root.properties --topic $KAFKA_TOPIC --time -2"

sum_1=$(docker run --rm -it -v $(pwd):/tmp --network kafka_default --entrypoint /opt/bitnami/kafka/bin/kafka-run-class.sh bitnami/kafka:3.1.0 $CMD_1 | grep -e ':[[:digit:]]*:' | awk -F  ":" '{sum += $3} END {print sum}')

sum_2=$(docker run --rm -it -v $(pwd):/tmp --network kafka_default --entrypoint /opt/bitnami/kafka/bin/kafka-run-class.sh bitnami/kafka:3.1.0 $CMD_2 | grep -e ':[[:digit:]]*:' | awk -F  ":" '{sum += $3} END {print sum}')


printf "Number of records in topic ${KAFKA_TOPIC} is: "$((sum_1 - sum_2))'\n'
