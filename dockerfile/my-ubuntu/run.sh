#!/bin/bash

docker build -t my-ubuntu .

docker run -itd --name my-ubuntu -p 122:22 -p 13306:3306 -p 16379:6379 my-ubuntu