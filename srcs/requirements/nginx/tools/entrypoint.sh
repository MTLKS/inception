#!/bin/bash

sed /etc/nginx/sites-available/nginx.conf -e "s/localhost/$DOMAIN_NAME/g" -i

exec "$@"