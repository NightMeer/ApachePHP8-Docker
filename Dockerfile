FROM php:8-apache
RUN apt-get update && apt-get upgrade -y  \
    && apt-get install -y rsync sendmail libfreetype-dev libjpeg62-turbo-dev libpng-dev libicu-dev zip libzip-dev libpq-dev \
    && docker-php-ext-configure intl && docker-php-ext-install intl \
    && docker-php-ext-configure pdo  && docker-php-ext-install pdo \
    && docker-php-ext-configure mysqli && docker-php-ext-install mysqli \
    && docker-php-ext-configure pdo_mysql  && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && docker-php-ext-install pgsql \
    && docker-php-ext-configure pdo_pgsql && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure zip && docker-php-ext-install zip \
    && a2enmod rewrite

EXPOSE 80

WORKDIR /var/www/html

VOLUME ["/config"]
VOLUME ["/var/www/html"]

COPY ./startup.sh /startup.sh
CMD chmod 777 /startup.sh

ENTRYPOINT "/startup.sh"
