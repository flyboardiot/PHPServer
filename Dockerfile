FROM ubuntu:18.04
MAINTAINER Flyrainning "http://www.fengpiao.net"


RUN apt-get update -y \
  && apt-get install -y \
    php-fpm \
    php-cli \
    php-imagick \
    php-json \
    php-services-json \
    php-mail \
    php-mbstring \
    php-mcrypt \
    php-memcached \
    php-mongodb \
    php-redis \
    php-ssh2 \
    php-xml \
    php-zip \
    php-curl \
    php-gd \
    php-mysql \
    php-odbc \
    php-sqlite3 \
    php-xmlrpc \
    php-sybase \
    php-amqp \
    php-geos \
    php-http-request \
    php-log \
    php-markdown \
    php-net-socket \
    php-pgsql \
    php-yaml \
    nginx \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*

ADD etc /etc
ADD app /app
ADD bin /bin

WORKDIR /app
RUN chmod a+x /bin/start.sh /bin/install.sh
RUN /bin/install.sh

ENV VERSION 1
ENV PATH "/app:$PATH"

EXPOSE 80
ENTRYPOINT ["/bin/start.sh"]
