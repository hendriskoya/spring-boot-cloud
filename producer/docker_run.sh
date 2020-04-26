#!/bin/bash

ARG1=$1
ARG1_DEFAULT="true"
ARG2=$2
ARG2_DEFAULT="true"
SPRING_CLOUD_CONFIG_ENABLED=${ARG1:-$ARG1_DEFAULT}
EUREKA_CLIENT_ENABLED=${ARG2:-$ARG2_DEFAULT}

# echo "$SPRING_CLOUD_CONFIG_ENABLED"

JAVA_OPTS="JAVA_OPTS="
# JMX ENABLING
JAVA_OPTS+="-Dcom.sun.management.jmxremote=true "
JAVA_OPTS+="-Dcom.sun.management.jmxremote.port=9191 "
JAVA_OPTS+="-Dcom.sun.management.jmxremote.local.only=false "
JAVA_OPTS+="-Dcom.sun.management.jmxremote.authenticate=false "
JAVA_OPTS+="-Dcom.sun.management.jmxremote.ssl=false "
JAVA_OPTS+="-Dcom.sun.management.jmxremote.rmi.port=9191 "
JAVA_OPTS+="-Djava.rmi.server.hostname=localhost "
# REMOTE DEBUG
JAVA_OPTS+="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8191"

docker run \
  --name producer \
  --network spring-boot-cloud \
  -p 8191:8191 \
  -p 9091:9091 \
  -p 9191:9191 \
  -e "$JAVA_OPTS" \
  -e "EUREKA_CLIENT_ENABLED=$EUREKA_CLIENT_ENABLED" \
  -e "SPRING_CLOUD_CONFIG_ENABLED=$SPRING_CLOUD_CONFIG_ENABLED" \
  -e "SPRING_CLOUD_CONFIG_URI=http://config-server:8888" \
  -e "EUREKA_CLIENT_SERVICE_URL=http://discovery:8761/eureka" \
  -e "RABBITMQ_HOST=rabbitmq" \
  --rm \
  producer:latest