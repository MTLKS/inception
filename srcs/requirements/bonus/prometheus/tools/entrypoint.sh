#!/bin/bash

if [ ! -d "/etc/prometheus/" ]; then

	groupadd --system prometheus
	useradd -s /sbin/nologin --system -g prometheus prometheus

	curl -s https://api.github.com/repos/prometheus/prometheus/releases/137096041|grep browser_download_url|grep linux-amd64|cut -d '"' -f 4|wget -qi -
	tar -xvf prometheus-2.49.1.linux-amd64.tar.gz

	mv prometheus-2.49.1.linux-amd64 /etc/prometheus
	mkdir -p /var/lib/prometheus

	chown prometheus:prometheus /etc/prometheus
	chown prometheus:prometheus /var/lib/prometheus
	chown -R prometheus:prometheus /etc/prometheus/consoles
	chown -R prometheus:prometheus /etc/prometheus/console_libraries

	cp /etc/prometheus/prometheus /usr/local/bin/
	cp /etc/prometheus/promtool /usr/local/bin/

	mv /tmp/prometheus.yml /etc/prometheus/prometheus.yml

fi

exec "$@"