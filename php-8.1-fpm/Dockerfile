FROM    php:8.1-fpm-alpine

ENV     ENV=$ENV

USER    root

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/


RUN     apk --no-cache add sudo \
        && chmod +x /usr/local/bin/install-php-extensions \
        && apk update \
        && apk add --update \
            nano \
        && install-php-extensions \
            amqp \
            apcu \
            bcmath \
            gd \
            igbinary \
            imagick \
            imap \
            intl \
            mcrypt \
            mongodb \
            opcache \
            pdo_mysql \
            redis \ 
            soap \
            xdebug \
            zstd \
            @composer \
        && mkdir /usr/local/etc/php/conf.d/disabled \ 
        && mv /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/disabled \ 
        && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"