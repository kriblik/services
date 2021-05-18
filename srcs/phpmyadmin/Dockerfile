#install attrs
FROM alpine:3.12
RUN apk update
RUN apk add nginx php7 php7-fpm php7-opcache \
    php7-gd php7-mysqli php7-zlib php7-curl \
    php7-mbstring php7-json php7-session php7-common \
    php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo \
    php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-mcrypt php7-gettext \
    php7-ldap php7-ctype php7-dom
RUN apk add vim
RUN apk add supervisor

EXPOSE 5000

#nginx config
RUN mkdir -p ./run/nginx/
COPY ./pma_ngnx.conf ./etc/nginx/conf.d/default.conf

#phpmyadmin config
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN mkdir -p /var/www/pma
RUN tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz -C /var/www/pma --strip-components 1
RUN mkdir -p /var/www/pma/tmp
RUN chmod 777 /var/www/pma/tmp
COPY ./config.inc.php ./var/www/pma/config.inc.php

#preority plus start
COPY ./supervisord.conf ./etc/
COPY ./start.sh ./
RUN chmod 777 ./start.sh
CMD ["/start.sh"]
