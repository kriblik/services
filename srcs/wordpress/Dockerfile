#install attrs
FROM alpine:3.12
RUN apk update
RUN apk add nginx
RUN apk add vim
RUN apk add supervisor
RUN apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl \
    php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
    php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    php7-ctype php7-dom php7-phar

EXPOSE 5050

#wordpress config
RUN wget https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN mkdir -p /var/www/wp
RUN tar -xvf latest-ru_RU.tar.gz -C /var/www/wp --strip-components 1
COPY ./wp-config.php ./var/www/wp/wp-config.php

#nginx config
RUN mkdir -p ./run/nginx/
COPY ./ngnx_wp.conf ./etc/nginx/conf.d/default.conf

#preority plus start
COPY ./supervisord.conf ./etc/
COPY ./start.sh ./
RUN chmod 777 ./start.sh
CMD ["/start.sh"]