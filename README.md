# pypotomux

pypotomux - A python protocol demuxed honeypot (potomiel)


## How to use

```bash
# Setup
sudo apt install -y sslh # Choose standalone
virtualenv -p python3 .py3 && source .py3/bin/activate
source .py3/bin/activate
pip install -r requirements.txt

# Start all
source start-all.sh
# Stop servers
ps fauxww |  grep potomiel | grep -v grep | awk '{ print $2 }' | xargs sudo kill -9
```