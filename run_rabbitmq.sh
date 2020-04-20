#!/bin/bash

docker run \
    --name rabbitmq \
    --network spring-boot-cloud \
    --rm \
    -p 5672:5672 \
    rabbitmq:3-management
