FROM php:7-apache

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
        bcmath

# Apache & PHP configuration
RUN a2enmod rewrite
ADD apache/vhost.conf /etc/apache2/sites-enabled/default.conf
ADD apache/start_safe_perms /start_safe_perms
ADD apache/run.sh /run.sh
ADD php/php.ini /usr/local/etc/php/php.ini

# Install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

RUN chown -R www-data:www-data /var/www/

CMD ["/run.sh"]
