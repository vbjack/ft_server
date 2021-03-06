#!/bin/bash

VAR1=`grep -c "autoindex on" /etc/nginx/sites-available/wp-site.conf`
if [[ $VAR1 > 0 ]]; then
	sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/wp-site.conf
	sed -i 's/index index.html/\#index index.html/' /etc/nginx/sites-available/wp-site.conf
else
	sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/wp-site.conf
	sed -i 's/\#index index.html/index index.html/' /etc/nginx/sites-available/wp-site.conf
fi
service nginx reload
