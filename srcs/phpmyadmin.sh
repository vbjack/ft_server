#!/bin/bash

#INSTALL PMA
wget -q https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-all-languages.tar.gz
tar xf phpMyAdmin-4.9.1-all-languages.tar.gz
mv phpMyAdmin-4.9.1-all-languages /usr/share/phpmyadmin
rm -rf phpMyAdmin-4.9.1-all-languages*
cp -rf config.inc.php /usr/share/phpmyadmin/config.inc.php

#CREATE DB
mysql < /usr/share/phpmyadmin/sql/create_tables.sql
echo "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

#MODIFY CONF FOR SITE
rm /etc/nginx/sites-enabled/default
cp -rf wp-site-autoindex.conf /etc/nginx/sites-available/wp-site.conf
ln -s /etc/nginx/sites-available/wp-site.conf /etc/nginx/sites-enabled/wp-site.conf

mkdir -p /usr/share/phpmyadmin/tmp
chmod 777 /usr/share/phpmyadmin/tmp
chown -R www-data:www-data /usr/share/phpmyadmin
