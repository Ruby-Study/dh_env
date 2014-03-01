#!/bin/bash

sudo apt-get install git -y
sudo apt-get install mysql-client-core-5.5 -y

# init mysql server
ID=$(sudo docker run -d -p 3306 -link mysql:db blackanger/my-mysql-server /run.sh)

echo "--- mysql container addr and port:"
echo $DB_PORT_3306_TCP_ADDR
echo $DB_PORT_3306_TCP_PORT
