FROM php:5.6-apache

# PHP extension

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxslt1-dev

RUN docker-php-ext-configure \
        gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
        gd \
        intl \
        mbstring \
        mcrypt \
        pdo_mysql \
        xsl \
        zip \
        soap \
        bcmath \
     && pecl install xdebug && docker-php-ext-enable xdebug \
     && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
     && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
     && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
     && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
     && echo "xdebug.max_nesting_level=1000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
     && chmod 666 /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Apache & PHP configuration
RUN a2enmod rewrite
ADD apache/vhost.conf /etc/apache2/sites-enabled/default.conf
ADD apache/start_safe_perms /start_safe_perms
ADD apache/run.sh /run.sh
ADD php/php.ini /usr/local/etc/php/php.ini

# Install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

# Install n98 magerun
RUN curl -O https://files.magerun.net/n98-magerun.phar \
    && mv n98-magerun.phar /usr/bin/n98

RUN chown -R www-data:www-data /var/www/

CMD ["/run.sh"]
