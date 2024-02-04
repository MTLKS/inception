FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y install nginx

COPY conf/static.conf /etc/nginx/sites-available/static.conf
RUN ln -s /etc/nginx/sites-available/static.conf /etc/nginx/sites-enabled/static.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

COPY conf/index.html /var/www/html/index.html

COPY tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]