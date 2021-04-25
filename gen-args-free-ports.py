#!/usr/bin/env python

import sys
import socket


def usage():
    print(f"Usage: python {sys.argv[0]} IP.IP.IP.IP")
    exit(42)


if len(sys.argv) != 2:
    usage()

ip = sys.argv[1]

free_ports = list()
for port in range(1, 65535 + 1):
    try:
        serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        serversocket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        serversocket.bind((ip, port))
        free_ports.append(port)
    except:
        # print(f"Port {port} is busy")
        pass

# Remove least used ports: keep free ports for ssh channels etc, avoid DOS :)
free_ports = free_ports[:64500] + free_ports[64510 + 10:]

options = " ".join([f"-p {ip}:{port}" for port in free_ports])
print(options)