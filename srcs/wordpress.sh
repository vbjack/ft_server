#!/bin/bash

wget https://ru.wordpress.org/latest-ru_RU.tar.gz
tar xf latest-ru_RU.tar.gz
cp -rf wordpress /var/www/wordpress
cp -rf /var/www/html/* /var/www/wordpress/
rm -rf wordpress latest-ru_RU.tar*
cp -rf wp-config.php /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress/
cp -rf fastcgi_params /etc/nginx/fastcgi_params
