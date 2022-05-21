FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

#Workspace
WORKDIR /usr/share/udemy

#ADD .jar under target from host
ADD target/selenium-docker.jar 			selenium-docker.jar
ADD target/selenium-docker-tests.jar 	selenium-docker-tests.jar
ADD target/libs							libs

#ADD suite files
ADD search-module.xml					search-module.xml
# ADD health check script
ADD healthcheck.sh                      healthcheck.sh

ENTRYPOINT sh healthcheck.sh