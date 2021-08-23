#!/bin/bash

for f in dump/ssh/*.json; do cat "$f" | jq -r '. | "\(.username):\(.password)"' ; done | sort -uV -o /tmp/new-pypotomux-ssh.lst
cat /tmp/new-pypotomux-ssh.lst pypotomux-ssh.lst | sort -uV -o pypotomux-ssh.lst
echo "Wordlist updated: pypotomux-ssh.lst"

