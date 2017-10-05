#!/bin/bash

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
envsubst < passwd.template > passwd
export LD_PRELOAD=libnss_wrapper.so
export NSS_WRAPPER_PASSWD=passwd
export NSS_WRAPPER_GROUP=/etc/group

if [ "$1" == "master" ]; then
  echo "Starting Spark Manager"
  ./sbin/start-master.sh
  tail -f /dev/null
elif [ "$1" == "slave" ]; then
  ./sbin/start-slave.sh spark://spark:7077
  tail -f /dev/null
else
    $@
fi
