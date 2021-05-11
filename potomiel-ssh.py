#!/usr/bin/env python

from binascii import hexlify
from os import system, path
from paramiko.py3compat import b, u, decodebytes
from rich import pretty, inspect, print as pp
import base64
import json
import os
import paramiko
import socket
import sys
import sys
import threading
import traceback
import uuid

pretty.install()
proto = "ssh"
port = 50022


def usage():
    print(f"Usage: python {sys.argv[0]}")
    exit(42)


if len(sys.argv) != 1:
    usage()


host_key = paramiko.RSAKey(filename="rsa-srv.key")

print("Read key: " + u(hexlify(host_key.get_fingerprint())))


class Server(paramiko.ServerInterface):
    # 'data' is the output of base64.b64encode(key)
    # (using the "user_rsa_key" files)
    # data = (
    # b"AAAAB3NzaC1yc2EAAAABIwAAAIEAyO4it3fHlmGZWJaGrfeHOVY7RWO3P9M7hp"
    # b"fAu7jJ2d7eothvfeuoRFtJwhUmZDluRdFyhFY/hFAh76PJKGAusIqIQKlkJxMC"
    # b"KDqIexkgHAfID/6mqvmnSJf0b5W8v5h2pI/stOSwTQ+pxVhwJ9ctYDhRSlF0iT"
    # b"UWT10hcuO4Ks8="
    # )
    # good_pub_key = paramiko.RSAKey(data=decodebytes(data))

    def __init__(self):
        self.event = threading.Event()

    def check_channel_request(self, kind, chanid):
        if kind == "session":
            return paramiko.OPEN_SUCCEEDED
        return paramiko.OPEN_FAILED_ADMINISTRATIVELY_PROHIBITED

    def check_auth_password(self, username, password):
        data = dict()
        data["username"] = username
        data["password"] = password
        with open(f"dump/{proto}/{uuid.uuid4().hex}.json", "w") as f:
            f.write(json.dumps(data, indent=2))
        # if (username == "nope") and (password == "nope"):
        # return paramiko.AUTH_SUCCESSFUL
        return paramiko.AUTH_FAILED

    def check_auth_publickey(self, username, key):
        print("Auth attempt with key: " + u(hexlify(key.get_fingerprint())))
        data = dict()
        data["username"] = username
        data["key"] = u(hexlify(key.get_fingerprint()))
        with open(f"dump/{proto}/{uuid.uuid4().hex}.json", "w") as f:
            f.write(json.dumps(data, indent=2))
        # if (username == "robey") and (key == self.good_pub_key):
        # return paramiko.AUTH_SUCCESSFUL
        return paramiko.AUTH_FAILED

    def get_allowed_auths(self, username):
        return "password,publickey"

    def check_channel_shell_request(self, channel):
        self.event.set()
        return False

    def check_channel_pty_request(
        self, channel, term, width, height, pixelwidth, pixelheight, modes
    ):
        return False


# now connect
try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    sock.bind(("127.0.0.1", port))
except Exception as e:
    print("*** Bind failed: " + str(e))
    traceback.print_exc()
    # sys.exit(1)

while True:
    try:
        sock.listen(100)
        print("Listening for connection ...")
        client, addr = sock.accept()
    except Exception as e:
        print("*** Listen/accept failed: " + str(e))
        traceback.print_exc()

    print("Got a connection!")

    try:
        t = paramiko.Transport(client)
        t.load_server_moduli()
        t.add_server_key(host_key)
        server = Server()
        t.start_server(server=server)
        # wait for auth
        chan = t.accept(20)
        if chan is None:
            print("*** No channel.")
        
    except Exception as e:
        print("*** Caught exception: " + str(e.__class__) + ": " + str(e))
        traceback.print_exc()
        try:
            t.close()
        except:
            pass
