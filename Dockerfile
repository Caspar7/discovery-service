FROM openjdk:8
MAINTAINER Caspar
LABEL app="discovery-service" version="0.0.1" by="caspar"
COPY ./build/libsdiscovery-service-0.0.1-SNAPSHOT.jar discovery-service.jar
CMD java -jar discovery-service.jar --spring.profiles.active=${env}
