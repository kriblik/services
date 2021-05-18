FROM alpine:3.12

RUN apk update
RUN apk add mysql mysql-client
RUN apk add vim
RUN apk add supervisor
RUN apk add openrc

EXPOSE 3306

COPY my.cnf /etc/my.cnf.d/
COPY wp.sql ./wp.sql

COPY supervisord.conf /etc/supervisord.conf
COPY start.sh ./
RUN chmod 777 /start.sh
CMD ["/start.sh"]