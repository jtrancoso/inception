#!/bin/bash
sudo service mysql start
sudo mysql_secure_installation << EOF

Y
1234
1234
Y
Y
Y
Y
EOF

sudo mysql -e "CREATE DATABASE IF NOT EXISTS wordpress"
sudo mysql -e "CREATE USER IF NOT EXISTS 'jesus'@'%' IDENTIFIED BY '1234'"
sudo mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'jesus'@'%'"
sudo mysql -e "CREATE USER 'user'@'%' IDENTIFIED BY '1234'"
sudo mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%'"
sudo mysql -e "FLUSH PRIVILEGES"
echo **Database Created**
sudo service mysql stop
sudo mysqld_safe
