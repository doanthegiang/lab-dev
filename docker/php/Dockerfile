FROM php:7.0-fpm-alpine
RUN apk add --no-cache bash socat wget curl file ffmpeg unzip \
    build-base shadow vim curl \
    freetype-dev \
    libpng-dev \
    jpeg-dev \
    libjpeg-turbo-dev \
    php7-fileinfo \
    php7-fpm \
    php7-session \
    zlib \
    php \
    php7 \
    php7-pdo \
    php7-mcrypt \
    php7-phar \
    php7-json \
    php7-openssl \
    php7-ctype \
    php7-opcache \
    php7-mbstring \
    php7-xml \
    php7-ftp \
    php7-simplexml \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-exif \
    php7-gd 

# 4 Add and Enable PHP-PDO Extenstions
RUN docker-php-ext-configure gd \
        --with-freetype-dir=/usr/lib/ \
        --with-png-dir=/usr/lib/ \
        --with-jpeg-dir=/usr/lib/ \
        --with-gd

RUN NUMPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NUMPROC} gd

RUN docker-php-ext-install pdo pdo_mysql mysqli exif
RUN docker-php-ext-enable pdo_mysql exif

# RUN curl -sS https://getcomposer.org/installer | /usr/bin/php -- --install-dir=/usr/bin --filename=composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# RUN mkdir -p /var/www

# 6 Remove Cache
RUN rm -rf /var/cache/apk/*

# 7 Add UID '1000' to www-data
RUN usermod -u 1000 www-data

# 8 Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www
# RUN sh -c 'touch data/sha1.csv'
# RUN chown www-data:www-data data/sha1.csv

# 9 Change current user to www
USER www-data



# RUN _buildConfig > inc/config.inc.php


# 10 Expose port 9000 and start php-fpm server
# EXPOSE 9000
CMD ["php-fpm"]



# ADD start.sh /etc/start.sh
# RUN chmod +x /etc/start.sh

# RUN sed -i -e 's/\r//g' /etc/start.sh

# RUN sed -i "/max_execution_time/c\max_execution_time=3600" /etc/php7/php.ini
# RUN sed -i "/max_input_time/c\max_input_time=3600" /etc/php7/php.ini

# WORKDIR /var/www/

# # Volumes to mount
# #VOLUME /var/lib/influxdb
# VOLUME /var/www/data

# ENTRYPOINT ["/etc/start.sh"]
