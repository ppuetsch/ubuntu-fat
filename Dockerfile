FROM ubuntu:latest
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Ubuntu Packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim binutils apt-transport-https ca-certificates curl wget gnupg-agent
RUN apt-get install -y software-properties-common python3 python3-pip
RUN apt-get install -y iputils-ping iputils-tracepath openjdk-11-jdk maven man-db sendmail

# Register Docker and Microsoft DEB Registries and install packages
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN add-apt-repository universe
RUN apt-get install -y powershell
RUN apt-get install -y docker-ce docker-ce-cli containerd.io
RUN yes | unminimize

# make python an alias of python3
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip

# install python packages
RUN pip install pandas altair

# configure java settings
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin

# move scripts
RUN mkdir -p scripts
COPY ./scripts /scripts

# configure environment
VOLUME ["/hostDirectory"]
WORKDIR /hostDirectory
