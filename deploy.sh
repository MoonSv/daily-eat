#!/bin/bash

echo "---Build the vue project---"
npm run build

echo "---Compress the dist directory---"
zip -r dist.zip dist

echo "---Transfer the compressed dist file to the remote server's target directory---"
scp dist.zip root@207.148.65.251:/root/daily-eat/

echo "---Transfer the restart docker script to the remote server---"
scp script/restart_docker_container.sh root@207.148.65.251:/root/daily-eat/

echo "---Login to server and run script---"
ssh root@207.148.65.251 "cd /root/daily-eat; chmod 777 restart_docker_container.sh; ./restart_docker_container.sh"

