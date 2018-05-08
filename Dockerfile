FROM ubuntu:trusty
MAINTAINER AliGorithm<alisher.coder@gmail.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to NZ
RUN sed -i "s/http:\/\/archive./http:\/\/se.archive./g" /etc/apt/sources.list

# Install node.js
RUN apt-get update && \
    apt-get install curl git -y && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
    apt-get install -y nodejs

ADD . /app
WORKDIR /app

# Install application dependencies
RUN npm init -y && npm install -g grunt-cli && \
    npm install --unsafe-perm=true

# Set entrypoint
CMD ["node","app.js"]
