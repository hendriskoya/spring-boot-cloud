#!/bin/bash

docker run \
  --name producer \
  --network spring-boot-cloud \
  -p 9091:9091 \
  -e "SPRING_CLOUD_CONFIG_URI=http://config-server:8888" \
  -e "EUREKA_CLIENT_SERVICE_URL=http://discovery:8761/eureka" \
  -e "RABBITMQ_HOST=rabbitmq" \
  --rm \
  producer:latest