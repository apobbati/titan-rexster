#!/bin/sh

IN=rexster-titan.xml.template
OUT=rexster-titan.xml

cp $IN $OUT

sed -i "s/_CASSANDRA_HOSTNAME_/${CASSANDRA_PORT_9160_TCP_ADDR}/g" $OUT
sed -i "s/_CASSANDRA_TCP_PORT_/${CASSANDRA_PORT_9160_TCP_PORT}/g" $OUT
sed -i "s/_ELASTICSEARCH_HOSTNAME_/${ELASTICSEARCH_PORT_9200_TCP_ADDR}/g" $OUT
sed -i "s/_ELASTICSEARCH_TCP_PORT_/${ELASTICSEARCH_PORT_9200_TCP_PORT}/g" $OUT

./bin/rexster.sh -s -c ../$OUT
