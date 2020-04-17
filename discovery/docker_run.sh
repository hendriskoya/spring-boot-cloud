#!/bin/bash

docker run \
  --name discovery \
  --network spring-boot-cloud \
  -p 8761:8761 \
  -e "SPRING_CLOUD_CONFIG_URI=http://config-server:8888" \
  --rm \
  discovery:latest