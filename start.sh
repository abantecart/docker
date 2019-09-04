#!/bin/bash
DB_HOST="mysql"
DB_USER="root"
DB_PASS="admin"
SERVER_PORT="8888"
AB_LOGIN="admin"
AB_PASS="admin"

if ! [ -d ./www ]; then
mkdir ./www
fi

if ! [ -d ./mysql ]; then
mkdir ./mysql
fi

docker-compose up -d --build

if ! [ -d ./www/abantecart ]; then
sleep 60;
docker-compose exec abantecart-dev mysql -h $DB_HOST -u $DB_USER -p$DB_PASS -e "create database abantecart;";

git clone https://github.com/abantecart/abantecart-src.git ./www/abantecart
docker-compose exec abantecart-dev chown -R www-data:www-data /var/www/abantecart
docker-compose exec abantecart-dev /usr/local/bin/php /var/www/abantecart/public_html/install/cli_install.php install --db_host=$DB_HOST --db_user=$DB_USER --db_password=$DB_PASS --db_name=abantecart  --db_driver=amysqli  --db_prefix=abc_ --admin_path=admin  --username=$AB_LOGIN  --password=$AB_PASS  --email=admin@admin.com  --http_server=http://localhost:$SERVER_PORT/ab/ --with-sample-data
fi


if ! [ -d ./www/abantecart2 ]; then
sleep 60;
docker-compose exec abantecart-dev mysql -h $DB_HOST -u $DB_USER -p$DB_PASS -e "create database abantecart2;";

git clone https://github.com/abantecart/abantecart_2.0.git ./www/abantecart2
docker-compose exec abantecart-dev bash -c "cd /var/www/abantecart2/abantecart/abc/ && composer install"
docker-compose exec abantecart-dev chown -R www-data:www-data /var/www/abantecart2
docker-compose exec abantecart-dev bash -c "cd /var/www/abantecart2/abantecart/abc/ && /usr/local/bin/php abcexec install:app  --db_host=$DB_HOST --db_user=$DB_USER --db_password=$DB_PASS --db_name=abantecart2  --db_driver=mysql --admin_secret=admin --admin_path=admin --username=$AB_LOGIN  --password=$AB_PASS  --email=admin@admin.com  --http_server=http://localhost:$SERVER_PORT/ab2/ --with-sample-data"
fi

