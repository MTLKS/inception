FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y install redis-server

COPY tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]