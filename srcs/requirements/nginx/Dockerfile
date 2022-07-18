FROM debian:buster

RUN apt update
RUN apt install -y nginx
RUN apt install -y vim
RUN apt install -y openssl
RUN mkdir -p /etc/ssl/private

COPY ./config/default /etc/nginx/sites-available/default
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN chmod 700 /etc/ssl/private
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1" -keyout /etc/ssl/private/nginx-server.key -out /etc/ssl/certs/nginx-server.crt


ENTRYPOINT ["nginx"]
