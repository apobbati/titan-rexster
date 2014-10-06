FROM dockerfile/java:oracle-java7

MAINTAINER Sean Kruzel <sean.kruzel.gmail.com> 

ENV TITAN_HOME /opt/titan-0.5.0-hadoop2
WORKDIR /opt/titan-0.5.0-hadoop2

RUN curl -o /opt/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-0.5.0-hadoop2.zip

RUN unzip /opt/titan.zip -d /opt/ && \
    rm /opt/titan.zip

ENV VERSION 0.27
ADD rexster-custom.xml.template $TITAN_HOME/rexster-custom.xml.template
ADD run.sh $TITAN_HOME/run.sh
RUN chmod +x $TITAN_HOME/run.sh

EXPOSE 8182
EXPOSE 8183
EXPOSE 8184

CMD ["/bin/bash", "-e", "run.sh"]
