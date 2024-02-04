#!/bin/bash

sed /etc/nginx/sites-available/static.conf -e "s/localhost/$DOMAIN_NAME/g" -i

exec "$@"