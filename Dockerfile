FROM openjdk:8
MAINTAINER Caspar
LABEL app="discoveryService" version="0.0.1" by="caspar"
COPY ./build/libs/discoveryService-0.0.1-SNAPSHOT.jar discoveryService.jar
CMD java -jar springbootdemo.jar
