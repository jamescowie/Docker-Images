FROM php:7.0.4-apache

MAINTAINER James Cowie <jcowie@magento.com>

RUN apt-get -y update
# essentials
RUN apt-get install -y git zip wget g++ libfreetype6-dev libicu-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libxslt1-dev
# nice-to-have
RUN apt-get install -y vim silversearcher-ag

RUN docker-php-ext-install -j$(nproc) mysqli pdo pdo_mysql mbstring bcmath gd mcrypt xsl zip soap

RUN apt-get install -y libicu-dev
RUN pecl install intl
RUN docker-php-ext-install intl gd

ENV COMPOSER_VERSION 1.2.0

RUN curl -sSL https://github.com/composer/composer/releases/download/$COMPOSER_VERSION/composer.phar -o /usr/local/bin/composer && \
	chmod +x /usr/local/bin/composer

COPY composer.json /opt/behat/composer.json
COPY php.ini /usr/local/etc/php

RUN cd /opt/behat && \
	composer install 2>&1

ENV PATH $PATH:/opt/behat/bin

WORKDIR /src

ENTRYPOINT ["behat"]
