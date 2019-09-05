# Include two main versions 1.2 and 2.0
Docker for AbanteCart


Clone this repository

Open terminal with this folder and run next commande

sh ./start.sh

after script complete the job (usually about 5-10 minutes) you will see two new folders
mysql - database data
www - AbanteCart files

Take a note: server should start with 8998 port for 1.2.15 and 8999 for 2.0

## Change ports

If for some reason these ports not available you can modify docker-compose.yml https://github.com/abantecart/docker/blob/master/docker-compose.yml#L6

## Nginx
NGINX configuration file is located in the docker/conf/default directory
After modify make sure to restart NGINX to apply configuration with next command
docker-compose exec abantecart-dev service nginx reload 
