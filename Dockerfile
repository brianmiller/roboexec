#Environment
FROM ubuntu:focal

#Me
LABEL maintainer=brian@phospher.com

ARG DEBIAN_FRONTEND=noninteractive

#Update the container
RUN apt-get -y update
RUN apt-get -y upgrade

#Basic tools
RUN apt-get install --no-install-recommends --no-install-suggests -y bash cron certbot

#Small prep stuff
RUN echo "set mouse-=a" > /root/.vimrc

#PATH
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#RUN and COPY
RUN touch /var/log/cron.log

#Dooyet
CMD ["/usr/sbin/cron -f -L 15"]
