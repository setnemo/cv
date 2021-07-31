FROM php:8.0.3-fpm-alpine

COPY . /app

RUN apk update \
    icu && \
    apk add --no-cache \
    build-base shadow vim curl supervisor \
    gcc musl-dev make libmcrypt-dev libmcrypt libzip-dev icu-dev \
    php8 \
    php8-fpm \
    php8-mbstring \
    php8-json \
    php8-phar \
    php8-gd \
    php8-pear \
    php8-dev

RUN apk add libpng libpng-dev libjpeg-turbo-dev libwebp-dev zlib-dev libxpm-dev gd
RUN docker-php-ext-install gd && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl && \
    docker-php-ext-enable intl

RUN pecl install mcrypt-1.0.4

# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Remove Cache
RUN rm -rf /var/cache/apk/*

VOLUME ["/app"]

WORKDIR /app

RUN composer install