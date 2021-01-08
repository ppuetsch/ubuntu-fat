FROM ubuntu:latest
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim binutils apt-transport-https ca-certificates curl wget gnupg-agent
RUN apt-get install software-properties-common python3.9 python3-pip
RUN apt-get install -y iputils-ping iputils-tracepath openjdk-11-jdk maven man-db sendmail
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io
RUN yes | unminimize
RUN mkdir -p scripts
RUN ln -s /usr/bin/python3.9 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install pandas altair
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin
COPY ./scripts /scripts
VOLUME ["/hostDirectory"]
WORKDIR /hostDirectory
