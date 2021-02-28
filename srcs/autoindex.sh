#!/bin/bash

VAR1=`grep -c "autoindex on" /etc/nginx/sites-available/wp-site.conf`
if [ $VAR1 = 1 ]; then
	sed -in 's/autoindex on/autoindex off/' /etc/nginx/sites-available/wp-site.conf
else
	sed -in 's/autoindex off/autoindex on/' /etc/nginx/sites-available/wp-site.conf
fi
service nginx restart
