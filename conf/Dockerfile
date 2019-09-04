FROM php:7.2-fpm-stretch
MAINTAINER Denis Vagner <help@abantecart.com>

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    nginx \
    mysql-client \
    mc \
    net-tools \
    libxml2-dev \
    && docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo_mysql zip soap bcmath \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

ADD default /etc/nginx/sites-available/
ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

WORKDIR /var/www/

EXPOSE 80

ENTRYPOINT service nginx start && php-fpm