#!/bin/bash

docker build -t my-ubuntu .

docker run -itd --name my-ubuntu -p 2222:22 my-ubuntu