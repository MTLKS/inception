#!/bin/bash

if [ ! -f "/etc/redis.conf.bak" ]; then
    cp /etc/redis.conf /etc/redis.conf.bak
    sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis.conf
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis.conf
fi

exec "$@"