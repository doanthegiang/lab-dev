FROM php:7.3-fpm

RUN apt-get update
RUN apt-get install -y \
 libfreetype6-dev \
 libjpeg62-turbo-dev \
 libpng-dev \
 libmcrypt-dev \
 openssl \
 supervisor \
 nginx

RUN docker-php-ext-install -j$(nproc) \
 exif \
 gd \
 json \
 mbstring


COPY ./docker1/nginx.conf /etc/nginx/sites-enabled
COPY ./docker1/start.sh /etc/start.sh
COPY ./docker1/supervisor.conf /etc/supervisor/conf.d/

RUN rm /etc/nginx/sites-enabled/default

COPY . /var/www/html/
WORKDIR /var/www/html/

# RUN rm -f inc/example.config.inc.php

RUN chmod -R 777 data
RUN chmod -R 777 tmp

RUN ls inc

#Init code
RUN chmod +x /etc/start.sh

ENTRYPOINT ["/etc/start.sh"]
