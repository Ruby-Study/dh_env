#!/bin/bash
set -x
set -e

sudo apt-get update

if [ ! -e /usr/bin/git ]; then
  sudo apt-get install git -y
fi

if [ ! -e /usr/bin/mysql ]; then
  sudo apt-get install mysql-client -y
fi


# init mysql server
MYSQL=`sudo docker ps|grep blackanger/my-mysql-server|awk '{print$1}'`
if [ -z "$MYSQL" ]; then
  echo $MYSQL
  ID=$(sudo docker run -d -p 3306 -name mysql blackanger/my-mysql-server /run.sh)
  sudo docker port $ID 3306
fi


# init ElasticSearch
ES=`sudo docker ps|grep blackanger/elasticsearch|awk '{print$1}'`
if [ -z "$ES" ]; then
  echo $ES
  sudo docker run -d -p 9200:9200 -p 9300:9300 -name elastics blackanger/elasticsearch
fi

# echo "--- mysql container addr and port:"
# echo $DB_PORT_3306_TCP_ADDR
# echo $DB_PORT_3306_TCP_PORT
