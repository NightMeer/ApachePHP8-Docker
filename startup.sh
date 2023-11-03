#!/bin/bash

if [ ! -d /config/apache2 ];
then
    echo "CONFIG NOT Found!"
    cp -R /etc/apache2/ /config
else
    echo "CONFIG Found!"
    cp -R /config/apache2/ /etc/
fi

if [ ! -d /config/php ];
then
    echo "CONFIG NOT Found!"
    touch /usr/local/etc/php/php.ini
    cp -R /usr/local/etc/php/ /config
else
    echo "CONFIG Found!"
    cp -R /config/php/ /usr/local/etc/
fi

chmod -R 777 /config/php/
chmod -R 777 /config/apache2/
chmod -R 777 /var/www/html/

apache2ctl -D FOREGROUND
