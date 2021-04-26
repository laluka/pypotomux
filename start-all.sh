#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 IP.IP.IP.IP"
    exit 42
fi

IP=$1

mkdir -pv logs
mkdir -pv dump
mkdir -pv dump/http
mkdir -pv dump/https
mkdir -pv dump/ssh
mkdir -pv /tmp/empty

source .py3/bin/activate

if [ ! -f "rsa-srv.key" ]; then
    ssh-keygen -t rsa -b 4096 -N "" -q -f rsa-srv.key
fi
script -f logs/ssh.log   -c "python potomiel-ssh.py" &
script -f logs/http.log  -c "python potomiel-http.py http" &
script -f logs/https.log -c "python potomiel-http.py https" &

sleep 1

BINDS=$(python gen-args-free-ports.py "$IP")

sudo sslh -v -f -u nobody \
    $BINDS \
    -C /var/empty/empty \
    --transparent -t 3 \
    --ssh 127.0.0.1:50022 \
    --http 127.0.0.1:50080 \
    --tls 127.0.0.1:50443

# Clean the mess if it failed
ps fauxww |  grep potomiel | grep -v grep | awk '{ print $2 }' | xargs sudo kill -9
