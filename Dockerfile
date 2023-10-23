FROM php:8-apache
RUN apt-get update && apt-get upgrade -y  && apt-get install -y rsync && apt-get install -y sendmail && apt-get install -y libicu-dev && docker-php-ext-configure intl && docker-php-ext-install intl && docker-php-ext-configure mysqli && docker-php-ext-install mysqli && a2enmod rewrite
EXPOSE 80

WORKDIR /var/www/html

VOLUME ["/config"]
VOLUME ["/var/www/html"]

COPY ./startup.sh /startup.sh
CMD chmod 777 /startup.sh

ENTRYPOINT "/startup.sh"