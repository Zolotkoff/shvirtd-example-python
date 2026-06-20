#!/bin/bash
set -e
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"
