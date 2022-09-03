#Environment
FROM ubuntu:focal

#Me
LABEL maintainer=brian@phospher.com

ARG DEBIAN_FRONTEND=noninteractive

#Update the container
RUN apt-get -y update
RUN apt-get -y upgrade

#Basic tools
RUN apt-get install --no-install-recommends --no-install-suggests -y bash cron rsyslog vim net-tools iputils-ping wget curl
RUN apt-get install --no-install-recommends --no-install-suggests -y certbot dnsutils openssh-client rsync

#Small prep stuff
RUN echo "set mouse-=a" > /root/.vimrc

#PATH
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#RUN and COPY
RUN mkdir -p /opt/stateless
COPY container/rsyslog.d.conf /etc/rsyslog.d/rsyslog.d.conf
COPY container/start.sh /opt/stateless/start.sh

#Dooyet
ENTRYPOINT ["/opt/stateless/start.sh"]
