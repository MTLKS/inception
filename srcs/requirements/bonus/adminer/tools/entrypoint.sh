#!/bin/bash

chown -R www-data:www-data /var/www/*
chown -R 755 /var/www/*
mkdir -p /run/php/
touch /run/php/php7.4-fpm.pid

mkdir -p /var/www/html/adminer
wget https://www.adminer.org/latest.php	-O /var/www/html/adminer/index.php

chown -R www-data:www-data .

exec "$@"