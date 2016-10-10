FROM ubuntu:16.04
MAINTAINER Bruno Luiz <contact@brunoluiz.net>

# Install basic packages
RUN apt-get update && apt-get install -y build-essential \
  curl \
  libexpat1-dev \
  libexpat1 \
  expat \
  make \
  python \
  unzip \
  wget \
  nano \
  git

# Setup the repositories to get the Node 6 and install it
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs=6.7.0-1nodesource1~xenial1

# Get, extract and install OCPP-JS
RUN mkdir ocppjs && \
  cd /ocppjs/ && \
  git clone https://github.com/brnluiz/docker-ocppjs.git . && \
  cd gir-ocppjs-1.0.2/ && \
  npm install jayschema@0.3.1 node-expat@2.3.15 request@2.75.0 websocket@1.0.23 xml2js@0.4.17

RUN export NODE_PATH=/usr/lib/nodejs

# Create a symbolic link to the ocppjs
#   - With this symbolic link, is easier to docker run the ocppjs. For example:
#     "docker run -p 9000:9000 -t -i brunoluiz/ocppjs node ocppjs start_cs 9000"
#     (do not forget to change the 9000 with your own port)
RUN ln -s /ocppjs/gir-ocppjs-1.0.2/gir-ocppjs.js /ocppjs.js
