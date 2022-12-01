# pypotomux

pypotomux - A python protocol demuxed honeypot (potomiel)
-> From now on, this repo will only contain the wordlists and be updated from broneypote

## How to update wordlists

```bash
ssh root@vpn.thinkloveshare.com tar -zcvf /tmp/dump.tgz /opt/broneypote/dump
scp root@vpn.thinkloveshare.com:/tmp/dump.tgz .
tar -zxvf dump.tgz; mv opt/broneypote/dump .
ssh root@vpn.thinkloveshare.com /bin/rm /tmp/dump.tgz
ssh root@vpn.thinkloveshare.com find /opt/broneypote/dump -type f -delete
act; python generate-wordlists.py
# Do the actual triage
git diff HEAD | grep -iE '^[-]'
git diff HEAD | grep -iE '^[+]' | cut -c 2- | less
grep -hrioP '[a-zA-Z0-9_-]+=' dump | tr -d = > /tmp/params; sort -uV wordlists/params.lst /tmp/params -o wordlists/params.lst
/bin/rm -rf opt dump.tgz dump /tmp/params
git commit -am "updated wordlist from broneypote"
```


## How to use - [DEPRECATED FOR BRONEYPOTE]

```bash
# Setup
sudo apt install -y sslh virtualenv bat # Choose standalone
virtualenv -p python3 .py3 && source .py3/bin/activate
source .py3/bin/activate
pip install -r requirements.txt

# Start all
# Use your exposed interface, not 0.0.0.0
./start-all.sh IP.IP.IP.IP
# Stop honeypots if it failed
ps fauxww |  grep potomiel | grep -v grep | awk '{ print $2 }' | xargs sudo kill -9

# Tests
curl -sk "http://0.0.0.0:9999/?coucou=maman"
curl -sk "https://0.0.0.0:9999/?nevergonna=giveyouup"
ssh -o StrictHostKeyChecking=no -p 9999 -i rsa-srv.key pouet@0.0.0.0
bat dump/*/*
```