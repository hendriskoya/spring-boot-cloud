#!/bin/bash

docker run \
  --name config-server \
  --network spring-boot-cloud \
  -v /home/hkoya/workspace/spring-boot-cloud-repository:/opt/git-repository \
  -e "GIT_REPOSITORY=/opt/git-repository" \
  -p 8888:8888 \
  --rm \
  config-server:latest
