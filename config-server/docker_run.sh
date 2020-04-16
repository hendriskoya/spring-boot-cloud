#!/bin/bash

docker run \
  --name config-server \
  --network spring-boot-cloud \
  -v /home/hkoya/workspace/spring-boot-cloud/git-config:/opt/git-config \
  -e "GIT_REPOSITORY=/opt/git-config" \
  -p 8888:8888 \
  --rm \
  config-server:latest
