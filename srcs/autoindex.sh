#!/bin/bash

VAR1=`grep -c "autoindex on" /etc/nginx/sites-available/wp-site.conf`
if [ $VAR1 = 1 ]; then
	cp -rf /srcs/wp-site.conf /etc/nginx/sites-available/wp-site.conf
else
	cp -rf /srcs/wp-site-autoindex.conf /etc/nginx/sites-available/wp-site.conf
fi
service nginx restart
