#!/bin/bash

#if [ ! -d /config/html ]; then
#    echo "HTML NOT Found"
#    cp -R /var/www/html/ /config
#else
#    echo "HTML Found"
#    cp -R /config/html/ /var/www/
#fi

if [ ! -d /config/apache2 ]; 
then
    echo "CONFIG NOT Found!"
    cp -R /etc/apache2/ /config
else
    echo "CONFIG Found!"
    cp -R /config/apache2/ /etc/
fi

#chmod -R 777 /config/html/
chmod -R 777 /config/apache2/
chmod -R 777 /var/www/html/

#while :; do rsync -au /config/html /var/www; rsync -au /var/www/html /config/; sleep 1; done & apache2ctl -D FOREGROUND
apache2ctl -D FOREGROUND
