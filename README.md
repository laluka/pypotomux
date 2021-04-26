# pypotomux

pypotomux - A python protocol demuxed honeypot (potomiel)


## How to use

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