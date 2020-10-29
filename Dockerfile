FROM ubuntu:latest
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim binutils apt-transport-https ca-certificates curl wget gnupg-agent software-properties-common python3 iputils-ping iputils-tracepath
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io
RUN mkdir -p scripts
COPY ./scripts /scripts
VOLUME ["/hostDirectory"]
WORKDIR /hostDirectory
