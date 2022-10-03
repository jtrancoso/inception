FROM debian:buster

RUN apt -y update
RUN apt install -y vim
RUN apt install -y sudo
RUN apt install -y mariadb-server

COPY ./config/start.sh /start.sh
RUN chmod 777 /start.sh

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./config/wordpress.sql /wordpress.sql

RUN chmod 777 /wordpress.sql

ENTRYPOINT [ "/start.sh" ]
