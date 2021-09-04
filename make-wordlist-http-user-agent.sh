#!/bin/bash



find dump/http  -type f -name "*.json" -exec jq -r 'with_entries( .key |= ascii_downcase ) ."user-agent"' {} \; | sort -uV -o wordlists/user-agent.lst
find dump/https -type f -name "*.json" -exec jq -r 'with_entries( .key |= ascii_downcase ) ."user-agent"' {} \; | sort -uV -o wordlists/user-agent.lst

