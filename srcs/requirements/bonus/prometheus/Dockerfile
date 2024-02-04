FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y install wget curl

COPY tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

COPY conf/prometheus.yml /tmp/prometheus.yml

EXPOSE 9090

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/var/lib/prometheus", "--web.console.libraries=/etc/prometheus/console_libraries", "--web.console.templates=/etc/prometheus/consoles", "--web.external-url=/prometheus/", "--web.route-prefix=/"]
