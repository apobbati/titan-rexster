FROM dockerfile/java:oracle-java7

MAINTAINER Sean Kruzel <sean.kruzel.gmail.com> 

WORKDIR /opt/titan-0.5.0-hadoop2

RUN curl -o /opt/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-0.5.0-hadoop2.zip

RUN unzip /opt/titan.zip -d /opt/ && \
    rm /opt/titan.zip

ENV VERSION 0.1
ADD rexster-titan.xml.template /opt/titan-0.5.0-hadoop2/
ADD run.sh /opt/titan-0.5.0-hadoop2/

EXPOSE 8182
EXPOSE 8183
EXPOSE 8184

CMD ["/bin/sh", "-e", "/opt/titan-0.5.0-hadoop2/run.sh"]
