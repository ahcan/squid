#Download ubunut latset
ARG CODER_VERSION=20.04
ARG DEBIAN_FRONTEND=noninteractive
FROM ubuntu:20.04
MAINTAINER huynguyen <huynguyen3108@gmail.com>
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y
RUN apt-get install tzdata -y
RUN apt-get install -y squid
COPY docker-entrypoint.sh /
ENV TZ=Asia/Ho_Chi_Minh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone &&\
	mkdir -p /var/cache/squid &&\ 
	chmod +x /docker-entrypoint.sh
COPY squid.conf /etc/squid/squid.conf
#ENTRYPOINT [ "/docker-entrypoint.sh" ]
ENTRYPOINT /etc/init.d/squid restart && /bin/bash
CMD [ "squid" ]
EXPOSE 3128/tcp
