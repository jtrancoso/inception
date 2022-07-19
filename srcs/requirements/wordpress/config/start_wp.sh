#!bin/bash

tar xf /latest.tar.gz -C /var/www/html
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i "s/database_name_here/wordpress/g" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/user/g" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/1234/g" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/mariadb/g" /var/www/html/wordpress/wp-config.php
chown www-data:www-data /var/www/html/wordpress/wp-config.php -R
php-fpm7.3 -F