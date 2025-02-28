#!/bin/bash

# only run once: check
if [ -f /var/run/init_mysql_done ]; then
    exit 0
fi

# create user
mysql << EOF
create user 'emlyn'@'%' identified by 'emlyn';
grant all privileges on *.* to 'emlyn'@'%' with grant option;
flush privileges;
EOF

# only run once: mark
touch /var/run/init_mysql_done
