#!bin/bash

tar xf /latest.tar.gz -C /var/www/html
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i "s/database_name_here/$DB_NAME/g" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/$DB_USER/g" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$DB_USER_PASS/g" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/$DB_HOST/g" /var/www/html/wordpress/wp-config.php
chown www-data:www-data /var/www/html/wordpress/wp-config.php -R
php-fpm7.3 -F