#!/bin/bash

mkdir -pv logs
mkdir -pv dump
mkdir -pv dump/http
mkdir -pv dump/https
mkdir -pv dump/ssh
mkdir -pv /tmp/empty

source .py3/bin/activate

python potomiel-http.py http  >> logs/http.log  2>&1 &
python potomiel-http.py https >> logs/https.log 2>&1 &

sudo sslh -v -f -u nobody \
    -p 0.0.0.0:9999 \
    -C /var/empty/empty \
    --transparent -t 3 \
    --ssh 127.0.0.1:50022 \
    --http 127.0.0.1:50080 \
    --tls 127.0.0.1:50443
