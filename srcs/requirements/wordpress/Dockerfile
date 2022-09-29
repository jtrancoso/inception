FROM debian:buster

RUN apt -y update
RUN mkdir -p /var/www/html
RUN apt install -y wget
RUN apt install -y tar
RUN wget https://wordpress.org/latest.tar.gz
RUN apt install -y php php-fpm php-mysql
RUN mkdir /run/php
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --path=/var/wordpress --allow-root

COPY ./config/start_wp.sh /start_wp.sh
RUN chmod 777 /start_wp.sh

COPY ./config/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 777 /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT ["/start_wp.sh"]
