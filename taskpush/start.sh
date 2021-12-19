#!/bin/bash

echo "\\n           \033[1;31mStopping container\\n"
sleep 3
docker stop flaskapp
echo "\\n           Deleting all containers\\n"
sleep 3
docker rm $(docker ps -qa)
echo "\n           Deleting image\\n"
sleep 3
docker rmi -f $(docker images -aq)
echo "\\n           \033[1;34mBuilding image\\n"
docker build -t my_app .
echo "\n"
echo "          \033[1;32mIMAGE HAS BEEN BUILT, STARTING CONTAINER
          open http://127.0.0.1:5000/ in your browser\033[0m"

docker run --name flaskapp -d -p 80:5000 my_app
docker rmi <none>
docker rmi python
docker rmi alpine