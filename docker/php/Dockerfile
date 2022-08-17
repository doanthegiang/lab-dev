FROM php:7.0-fpm-alpine
RUN apk add --no-cache bash socat wget curl nginx file ffmpeg unzip \
    php7-fileinfo \
    php7-session \
    zlib \
    php \
    php7 \
    php7-phar \
    php7-json \
    php7-openssl \
    php7-ctype \
    php7-opcache \
    php7-mbstring \
    php7-xml \
    php7-ftp \
    php7-simplexml 
RUN curl -sS https://getcomposer.org/installer | /usr/bin/php -- --install-dir=/usr/bin --filename=composer
RUN mkdir -p /var/www
WORKDIR /var/www

ADD . /var/www/.

ADD start.sh /etc/start.sh
RUN chmod +x /etc/start.sh

RUN sed -i -e 's/\r//g' /etc/start.sh

RUN sed -i "/max_execution_time/c\max_execution_time=3600" /etc/php7/php.ini
RUN sed -i "/max_input_time/c\max_input_time=3600" /etc/php7/php.ini

WORKDIR /var/www/

# Volumes to mount
#VOLUME /var/lib/influxdb
VOLUME /var/www/data

ENTRYPOINT ["/etc/start.sh"]
