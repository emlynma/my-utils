#!/bin/bash

# ssh
mkdir -p /home/emlyn/.ssh
ssh-keygen -t rsa -f /home/emlyn/.ssh/id_rsa -C "emlyn.ma@gmail.com" -N ""