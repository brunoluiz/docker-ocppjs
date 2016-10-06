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
  nano

# Setup the repositories to get the Node 6 and install it
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs \
  node-node-expat

# Get, extract and install OCPP-JS
#   - It will throw an error no node-expat compilation
RUN cd /root/ && \
  wget https://github.com/brnluiz/docker-ocppjs/raw/master/gir-ocppjs-1.0.2.original.zip && \
  unzip -o gir-ocppjs-1.0.2.original.zip -d . && \
  cd gir-ocppjs-1.0.2 && \
  npm install || true

# Create a symbolic link to the ocppjs
#   - With this symbolic link, is easier to docker run the ocppjs. For example:
#     "docker run -p 9000:9000 -t -i brunoluiz/ocppjs node ocppjs start_cs 9000"
#     (do not forget to change the 9000 with your own port)
RUN ln -s /root/gir-ocppjs-1.0.2/gir-ocppjs.js /ocppjs.js
