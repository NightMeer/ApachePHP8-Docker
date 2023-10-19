FROM php:8-apache
RUN apt-get update && apt-get upgrade -y && apt-get install -y rsync && apt-get install -y libicu-dev && docker-php-ext-configure intl && docker-php-ext-install intl && a2enmod rewrite
EXPOSE 80

WORKDIR /var/www/html

VOLUME ["/config"]

COPY ./startup.sh /startup.sh
CMD chmod 777 /startup.sh

ENTRYPOINT "/startup.sh"