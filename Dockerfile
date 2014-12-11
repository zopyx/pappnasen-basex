#FROM ubuntu:14.04
#MAINTAINER Andreas Jung <yet@gmx.de>
#
#RUN sudo apt-get -y install software-properties-common
#RUN sudo add-apt-repository ppa:webupd8team/java
#RUN sudo apt-get update
#RUN sudo apt-get -y install oracle-java8-installer


#
# Oracle Java 8 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java8
#

# Pull base image.
FROM dockerfile/ubuntu

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN wget -O basex.zip http://files.basex.org/releases/latest/BaseX80-20141211.021425.zip
RUN unzip basex.zip
RUN basex/bin/basexhttp
EXPOSE 1984 8984
# Define default command.
#CMD ["bash"]
