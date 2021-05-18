#!/bin/sh
openrc default ;
/etc/init.d/mariadb setup
rc-service mariadb start && echo "CREATE DATABASE wp;" | mysql -u root --skip-password && echo "CREATE USER '1'@'%' IDENTIFIED BY '1';" | mysql -u root --skip-password && echo "CREATE USER '2'@'%' IDENTIFIED BY '2';" | mysql -u root --skip-password && echo "GRANT ALL PRIVILEGES ON *.* TO '1'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password && echo "GRANT ALL PRIVILEGES ON *.* TO '2'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password && \
mysql -u root --skip-password < ./wp.sql
rc-service mariadb stop
supervisord