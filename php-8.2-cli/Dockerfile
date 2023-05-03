FROM    php:8.2-cli-alpine

ENV     ENV=$ENV

USER    root

ADD     https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/


RUN     chmod +x /usr/local/bin/install-php-extensions \
        && apk update --no-cache \
        && apk add --update --no-cache \
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
            sysvsem \ 
            soap \
            xdebug \
            xsl \
            zstd \
            @composer \
        && mkdir /usr/local/etc/php/conf.d/disabled \ 
        && mv /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/disabled \ 
        && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
        && mkdir -p /var/www/html/public


WORKDIR /var/www/html