#!/bin/bash

if [ ! -d "/usr/local/bin/node_exporter" ]; then
	curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest| grep browser_download_url|grep linux-amd64|cut -d '"' -f 4|wget -qi -
	tar -xvf node_exporter-*.linux-amd64.tar.gz
	mv node_exporter-*.linux-amd64/node_exporter /usr/local/bin/
fi

exec "$@"