FROM jcrugzz/s6-node-ubuntu:6.11.2

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer unzip xvfb libxi6 libgconf-2-4 && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

RUN \
  apt-get update && \
  apt-get install -y libnss3 libfontconfig

RUN \
  apt-get update && \
  apt-get install -y libxss1 libappindicator1 libindicator7 libasound2 fonts-liberation xdg-utils && \
  wget -N https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  sudo dpkg -i google-chrome-stable_current_amd64.deb && \
  sudo apt-get -f install -y && \
  sudo dpkg -i google-chrome-stable_current_amd64.deb


ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
