FROM grayindustries/docker-sensu-client
MAINTAINER Greg Poirier <grep@gray.industries>

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-software-properties software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-add-repository -y ppa:rwky/redis
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y redis-server

ADD files/supervisord-redis.conf /etc/supervisor/conf.d/redis.conf

EXPOSE 6379
