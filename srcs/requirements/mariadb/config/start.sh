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

sudo mysql -e "CREATE $DB_NAME charset utf8mb4 collate utf8mb4_unicode_ci"
sudo mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS'"
sudo mysql -e "GRANT ALL PRIVILEGES ON * . * TO '$DB_USER'@'%'"
sudo mysql -e "CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASS'"
sudo mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$WP_USER'@'%'"
sudo mysql -e "FLUSH PRIVILEGES"
sudo service mysql stop
sudo mysqld_safe
