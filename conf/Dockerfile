FROM php:8.1.2-fpm
LABEL maintainer="Denis Vagner <help@abantecart.com>"

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    libwebp-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxpm-dev \
    libonig-dev \
    libzip-dev \
    nginx \
    mariadb-client \
    mc \
    net-tools  \
    libxml2-dev && \
    docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo_mysql zip soap bcmath && \
    docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 
RUN apt-get install -y librabbitmq-dev && \
    pecl install amqp

# RUN docker-php-ext-install sockets

ADD default /etc/nginx/sites-available/
ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

WORKDIR /var/www/

EXPOSE 80

ENTRYPOINT service nginx start && php-fpm