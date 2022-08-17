FROM php:7.0-fpm-alpine

# ADD start.sh /etc/start.sh
# RUN chmod +x /etc/start.sh

RUN mkdir -p /etc/php7
RUN echo -n > /etc/php7/php.ini
RUN chmod +x /etc/php7/php.ini

RUN sed -i "/max_execution_time/c\max_execution_time=3600" /etc/php7/php.ini
RUN sed -i "/max_input_time/c\max_input_time=3600" /etc/php7/php.ini
