# Include two main versions 1.2 and 2.0

## Docker for AbanteCart Requrements

Read the instructions below before.

 1. Make sure Docker is installed and started (run `docker -v` in terminal)
 2. Make sure next ports are available 3310 (for mysql), 8998 and 8999
 
## Change ports

If these ports not available you can modify `docker-compose.yml` https://github.com/abantecart/docker/blob/master/docker-compose.yml#L6 file

## Change AbanteCart branches

By default master branches will be installed however you can modify `start.sh` file
- 1.2 https://github.com/abantecart/docker/blob/master/start.sh#L24
- 2.0 https://github.com/abantecart/docker/blob/master/start.sh#L34
 
## How to start

1. Clone this repository

2. Open terminal at folder where files located and run next command 

`sh ./start.sh`

3. after script complete the job (usually about **5-10 minutes**) you will see two new folders

- mysql - database data
- www - files

> Take a note: server should start with 8998 port for 1.2.15 and 8999 for 2.0
- http://localhost:8998/ AbanteCart 1.2
- http://localhost:8999/ 2.0


## Nginx
NGINX configuration file is located in the `docker/conf/default` directory https://github.com/abantecart/docker/blob/master/conf/default
After modify make sure to restart NGINX to apply configuration with next command
`docker-compose exec abantecart-dev service nginx reload`
