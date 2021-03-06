#!/bin/bash

wget https://ru.wordpress.org/latest-ru_RU.tar.gz
tar xf latest-ru_RU.tar.gz
cp -rf wordpress/* /var/www/html
rm -rf wordpress latest-ru_RU.tar*
cp -rf wp-config.php /var/www/html/
chown -R www-data:www-data /var/www/html/
cp -rf fastcgi_params /etc/nginx/fastcgi_params
