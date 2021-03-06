FROM jcrugzz/s6-node-ubuntu:8.9.4

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | \
  debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer unzip xvfb libxi6 libgconf-2-4 && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
