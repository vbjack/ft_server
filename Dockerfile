FROM debian:buster

RUN	apt-get update
RUN apt-get install -y openssl nginx wget php7.3-fpm php7.3-mysql vim
RUN apt-get install -y mariadb-client mariadb-server

RUN mkdir /srcs
COPY srcs/autoindex.sh /srcs
COPY srcs/config.inc.php /srcs
COPY srcs/fastcgi_params /srcs
COPY srcs/phpmyadmin.sh /srcs
COPY srcs/ssl-params.conf /srcs
COPY srcs/start.sh /srcs
COPY srcs/wordpress.sh /srcs
COPY srcs/wp-config.php /srcs
COPY srcs/wp-site-autoindex.conf /srcs
COPY srcs/wp-site.conf /srcs

EXPOSE 80
EXPOSE 443

CMD /srcs/start.sh
