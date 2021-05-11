#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ip|port|date|method|path|version|Host|User-Agent|Content-Length|username|password>"
    exit 42
fi

prop="$1"

find dump -name "*.json" | xargs cat | jq -r ".[\"$prop\"]"  | sort -uV

