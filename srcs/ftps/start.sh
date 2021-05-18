#!/bin/sh
adduser 1 -D ; echo "1:1" | chpasswd
supervisord