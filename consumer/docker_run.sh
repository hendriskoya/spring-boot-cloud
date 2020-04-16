#!/bin/bash

docker run \
  --name consumer \
  --network spring-boot-cloud \
  -p 9092:9092 \
  -e "SPRING_CLOUD_CONFIG_URI=http://config-server:8888" \
  --rm \
  consumer:latest