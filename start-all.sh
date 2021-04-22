#!/bin/bash

mkdir -pv logs
mkdir -pv dump
mkdir -pv dump/http
mkdir -pv dump/https
mkdir -pv dump/ssh
mkdir -pv /tmp/empty

source .py3/bin/activate

rm -f rsa-srv*
ssh-keygen -t rsa -b 4096 -N "" -q -f rsa-srv.key
script -f logs/ssh.log   -c "python potomiel-ssh.py" &
script -f logs/http.log  -c "python potomiel-http.py http" &
script -f logs/https.log -c "python potomiel-http.py https" &

sleep 1

sudo sslh -v -f -u nobody \
    -p 0.0.0.0:9999 \
    -C /var/empty/empty \
    --transparent -t 3 \
    --ssh 127.0.0.1:50022 \
    --http 127.0.0.1:50080 \
    --tls 127.0.0.1:50443
