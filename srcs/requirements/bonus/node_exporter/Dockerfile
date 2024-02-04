FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y install wget curl

ADD tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

EXPOSE 9100

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["/usr/local/bin/node_exporter"]