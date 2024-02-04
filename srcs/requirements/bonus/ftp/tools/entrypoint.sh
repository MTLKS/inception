#!/bin/bash

if ! grep "^$FTP_USER:" /etc/passwd &>/dev/null; then
	useradd -m $FTP_USER
	echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
	mkdir -p /var/run/vsftpd/empty
	usermod -aG www-data $FTP_USER
fi

exec "$@"