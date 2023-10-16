FROM php:8-apache
RUN apt-get update && apt-get upgrade -y && apt-get install -y rsync
EXPOSE 80

WORKDIR /var/www/html

VOLUME ["/html"]
VOLUME ["/config"]

COPY ./startup.sh /startup.sh
CMD chmod 777 /startup.sh

ENTRYPOINT "/startup.sh"