
#sudo docker run -d -p 221:22 -v /var/run/docker.sock:/var/run/docker.sock -e CONTAINER=docker_php_1 -e AUTH_MECHANISM=noAuth jeroenpeeters/docker-ssh
#sudo docker run -d -p 222:22 -v /var/run/docker.sock:/var/run/docker.sock -e CONTAINER=docker_db-2_1 -e AUTH_MECHANISM=noAuth jeroenpeeters/docker-ssh

sudo docker-compose up

