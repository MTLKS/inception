FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y install mariadb-server

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["mysqld", "--user=mysql", "--console"]