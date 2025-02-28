#!/bin/bash

service ssh start
service mysql start
service redis-server start

sh /root/init_mysql.sh
sh /root/init_redis.sh

tail -f /dev/null