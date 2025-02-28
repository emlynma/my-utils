#!/bin/bash

# only run once: check
if [ -f /var/run/init_redis_done ]; then
    exit 0
fi

# nothing to do now

# only run once: mark
touch /var/run/init_redis_done
