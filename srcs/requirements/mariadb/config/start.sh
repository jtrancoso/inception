#!/bin/bash

sudo service mysql start
sudo mysql_secure_installation << EOF

Y
$DB_ROOT_PASS
$DB_ROOT_PASS
Y
Y
Y
Y
EOF
result=$(sudo mysql -s -N -e "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='$DB_NAME'");
if [ -z "$result" ]; then
  sudo mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME charset utf8mb4 collate utf8mb4_unicode_ci"
  sudo mysql $DB_NAME < /wordpress.sql
fi
sudo mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS'"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%'"
sudo mysql -e "CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASS'"
sudo mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$WP_USER'@'%'"
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED with mysql_native_password"
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"
sudo mysql -e "FLUSH PRIVILEGES"
sudo service mysql stop
sudo mysqld_safe
