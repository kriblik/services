FROM alpine:3.12
RUN apk update
RUN apk add openrc nginx openssl vim supervisor

EXPOSE 80 443 22

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/nginx.pem -keyout /etc/nginx/ssl/nginx.key -subj "/C=RU/ST=Moscow/L=Moscow/O=Spitt corp./OU=SPitt/CN=othercrt"
RUN mkdir -p /run/nginx/
COPY example.html var/www/example.html
COPY ngnx.conf /etc/nginx/conf.d/default.conf

COPY supervisord.conf /etc/supervisord.conf
COPY start.sh ./
RUN chmod 777 /start.sh
CMD ["/start.sh"]
