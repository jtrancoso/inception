#!/bin/bash

service mysql start
mysql_secure_installation << EOF

Y
$DB_ROOT_PASS
$DB_ROOT_PASS
Y
Y
Y
Y
EOF

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME charset utf8mb4 collate utf8mb4_unicode_ci"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%'"
mysql -e "CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASS'"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$WP_USER'@'%'"
mysql -e "FLUSH PRIVILEGES"
service mysql stop
mysqld_safe
