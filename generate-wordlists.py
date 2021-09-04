#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import glob

def extract_all_keys(data, key):
    matches = set()
    for result in data:
        for _key in data[result].keys():
            if key.lower() == _key.lower():
                matches.add(data[result][_key])
    return matches

data = dict()

print("[+] Loading data")
for file in glob.iglob("./dump/**/*.json"):
    with open(file, 'r') as f:
        data[file] = json.loads(f.read())

print("[+] Extracting keys")
doings = [
    "accept",
    "accept-charset",
    "accept-encoding",
    "accept-language",
    "authorization",
    "body",
    "cache-control",
    "connection",
    "content-type",
    "cookie",
    "from",
    "keep-alive",
    "method",
    "password",
    "path",
    "soapaction",
    "st",
    "te",
    "translate",
    "user",
    "user-agent",
    "username",
    "version",
    "via",
    "wsmanidentify",
    "x-forwarded-for",
    "x-requested-with"
]

for doing in doings:
    print(f"[+] Dumping: {doing}")
    with open(f"wordlists/{doing}.lst", "w") as f:
        findings = sorted(extract_all_keys(data, doing))
        # Implement filtering and sanitization
        if doing == "accept":
            print("TODO sanityze")
        elif doing == "accept-charset":
            print("TODO sanityze")
        elif doing == "accept-encoding":
            print("TODO sanityze")
        elif doing == "accept-language":
            print("TODO sanityze")
        elif doing == "authorization":
            print("TODO sanityze")
        elif doing == "body":
            print("TODO sanityze")
        elif doing == "cache-control":
            print("TODO sanityze")
        elif doing == "connection":
            print("TODO sanityze")
        elif doing == "content-type":
            print("TODO sanityze")
        elif doing == "cookie":
            print("TODO sanityze")
        elif doing == "from":
            print("TODO sanityze")
        elif doing == "keep-alive":
            print("TODO sanityze")
        elif doing == "method":
            print("TODO sanityze")
        elif doing == "password":
            print("TODO sanityze")
        elif doing == "path":
            print("TODO sanityze")
        elif doing == "soapaction":
            print("TODO sanityze")
        elif doing == "st":
            print("TODO sanityze")
        elif doing == "te":
            print("TODO sanityze")
        elif doing == "translate":
            print("TODO sanityze")
        elif doing == "user":
            print("TODO sanityze")
        elif doing == "user-agent":
            print("TODO sanityze")
        elif doing == "username":
            print("TODO sanityze")
        elif doing == "version":
            print("TODO sanityze")
        elif doing == "via":
            print("TODO sanityze")
        elif doing == "wsmanidentify":
            print("TODO sanityze")
        elif doing == "x-forwarded-for":
            print("TODO sanityze")
        elif doing == "x-requested-with":
            print("TODO sanityze")
        f.write("\n".join(findings))