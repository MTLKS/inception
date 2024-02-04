#!/bin/bash

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

echo "Starting MariaDB..."

if [ ! -d "/var/lib/mysql/${WP_DATABASE_NAME}" ]; then
	
	echo "Initializing database..."
	chown -R mysql:mysql /var/lib/mysql

	# init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	mysql_secure_installation_script="
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	CREATE DATABASE IF NOT EXISTS ${WP_DATABASE_NAME};
	CREATE USER IF NOT EXISTS '${WP_DATABASE_USER}'@'%' IDENTIFIED BY '${WP_DATABASE_PASS}';
	GRANT ALL PRIVILEGES ON ${WP_DATABASE_NAME}.* TO '${WP_DATABASE_USER}'@'%';
	FLUSH PRIVILEGES;
	"

	mysqld --user=mysql --bootstrap <<< $mysql_secure_installation_script
fi

# allow remote connections
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

exec "$@"