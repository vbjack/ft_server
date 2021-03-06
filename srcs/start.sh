#!/bin/bash

cd srcs
#SSL-CERTIFICATE
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=21School/OU=mtwitch/CN=localhost"

#NGINX
touch /etc/nginx/snippets/self-signed.conf
echo "ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;" >> /etc/nginx/snippets/self-signed.conf
echo "ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" >> /etc/nginx/snippets/self-signed.conf
cp -rf ssl-params.conf /etc/nginx/snippets/

#MY_SQL
mysql_install_db
service mysql start

#PHPMYADMIN
chmod +x phpmyadmin.sh
./phpmyadmin.sh

#WORDPRESS_INSTALL
chmod +x wordpress.sh
./wordpress.sh

chmod +x autoindex.sh

#START SERVICES
service php7.3-fpm start
service nginx stop
nginx -g "daemon off;"
