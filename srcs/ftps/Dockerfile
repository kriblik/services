FROM alpine:3.12
RUN apk update
RUN apk add vsftpd vim supervisor openssl

EXPOSE 21 20
EXPOSE 30020-30021

COPY vsftpd.conf ./etc/vsftpd/vsftpd.conf
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/private/ftrpk.pem -keyout /etc/ssl/private/ftrpk.key -subj "/C=RU/ST=Moscow/L=Moscow/O=Spitt corp./OU=SPitt/CN=othercrt"

COPY ./supervisord.conf ./etc/
COPY ./start.sh ./
RUN chmod 777 ./start.sh
CMD ["/start.sh"]