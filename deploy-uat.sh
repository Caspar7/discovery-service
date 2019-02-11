#!/usr/bin/env bash

BUILD_NUMBER=$1
serviceName="discoveryService"
running=`docker ps | grep ${serviceName} | awk '{print $1}'`
if [ ! -z "$running" ]; then
    docker stop $running
fi

container=`docker ps -a | grep ${serviceName} | awk '{print $1}'`
if [ ! -z "$container" ]; then
    docker rm $container -f
fi

imagesid=`docker images|grep -i ${serviceName}|awk '{print $3}'`
if [ ! -z "$imagesid" ]; then
    docker rmi $imagesid -f
fi

docker build -t ${serviceName}:v$BUILD_NUMBER .

docker run -it -d -p 8888:8888 --name ${serviceName} ${serviceName}:v$BUILD_NUMBER --env env=uat