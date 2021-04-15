# pypotomux

pypotomux - A python protocol demuxed honeypot (potomiel)


## Setup

```bash
sudo apt install -y sslh # Choose standalone

sudo sslh -v -f -u nobody -t 3 --transparent -p 0.0.0.0:9999 -C /var/empty/empty \
    --ssh 127.0.0.1:50022 \
    --http 127.0.0.1:50080 \
    --tls 127.0.0.1:50443 \
    --socks5 127.0.0.1:51080 \
    --xmpp 127.0.0.1:55222 \
    --tinc 127.0.0.1:50655 \
    --openvpn 127.0.0.1:51194
```


## TODO

- [x] python honeypot serverr for http
- [] python honeypot serverr for tls
- [] python honeypot serverr for ssh
- [] python honeypot serverr for socks5
- [] python honeypot serverr for xmpp
- [] python honeypot serverr for tinc
- [] python honeypot serverr for openvpn
