#!/bin/bash
set -x
set -e

# sudo apt-get update

if [ ! -e /usr/bin/git ]; then
  sudo apt-get install git -y
fi

if [ ! -e /usr/bin/mysql ]; then
  sudo apt-get install libmysql-ruby libmysqlclient-dev -v
  sudo apt-get install mysql-client -y
fi

# init nginx
if [ ! -e /usr/sbin/nginx ]; then
  sudo apt-get install nginx -y
fi


# init mysql server
MYSQL=`sudo docker ps|grep blackanger/my-mysql-server|awk '{print$1}'`
if [ -z "$MYSQL" ]; then
  ID=$(sudo docker run -d -p 3306:49153 -name mysql blackanger/my-mysql-server /run.sh)
fi




# init ElasticSearch
# ES=`sudo docker ps|grep blackanger/elasticsearch|awk '{print$1}'`
# if [ -z "$ES" ]; then
#   echo $ES
#   sudo docker run -d -p 9200:9200 -p 9300:9300 -name elastics blackanger/elasticsearch
# fi


# init memcached
MEMCACHED=`sudo docker ps|grep blackanger/memcached|awk '{print$1}'`
if [ -z "$MEMCACHED" ]; then
  sudo docker run -d -p 11211:11211 -name memcached blackanger/memcached
fi

# init Nginx
NGINX=`ps -ef|grep nginx|awk '{print$2}'`
if [ -z "NGINX" ]; then
  sudo apt-get install nginx -y
  sudo service nginx start
fi
