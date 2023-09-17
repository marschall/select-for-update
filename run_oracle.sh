#!/bin/bash
# https://github.com/oracle/docker-images/blob/master/OracleDatabase/SingleInstance/README.md#running-oracle-database-enterprise-and-standard-edition-2-in-a-docker-container
DIRECTORY=`dirname $0`
DIRECTORY=$(realpath $DIRECTORY)

docker run --name oracle-select-for-update \
 -p 1521:1521 -p 5500:5500 \
 --shm-size=10g \
 -e INIT_PGA_SIZE=10000 \
 -e INIT_SGA_SIZE=10000 \
 -v ${DIRECTORY}/sql/ddl:/docker-entrypoint-initdb.d/setup \
 -d oracle/database:19.3.0-se2
