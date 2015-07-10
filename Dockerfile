FROM ubuntu:latest

MAINTAINER Abhinav Pobbati <apobbati@codeblock.io>

RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

RUN apt-get install -y unzip curl oracle-java8-installer

WORKDIR /opt/titan-0.5.4-hadoop2

RUN curl -o /opt/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-0.5.4-hadoop2.zip

RUN unzip /opt/titan.zip -d /opt/ && \
    rm /opt/titan.zip

ADD rexster-titan.xml.template /opt/titan-0.5.4-hadoop2/
ADD run.sh /opt/titan-0.5.4-hadoop2/

EXPOSE 8182
EXPOSE 8183
EXPOSE 8184

CMD ["/bin/sh", "-e", "/opt/titan-0.5.4-hadoop2/run.sh"]
