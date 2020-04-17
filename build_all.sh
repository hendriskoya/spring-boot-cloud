#!/bin/bash

cd config-server
./docker_build.sh build

cd ../discovery
./docker_build.sh build

cd ../producer
./docker_build.sh build

cd ../consumer
./docker_build.sh build