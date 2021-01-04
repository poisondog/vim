FROM debian
MAINTAINER Adam

RUN apt-get update && apt-get -y install vim openjdk-11-jre openjdk-11-jdk git gradle mvn
CMD [/bin/bash]
