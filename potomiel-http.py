#!/usr/bin/env python

import uuid
import socket
import time

HOST = "127.0.0.1"
PORT = 50080
BUFF_SIZE = 512
RESP = b"""HTTP/1.0 200 OK\r\nServer: SimpleHTTP/0.6 Python/3.8.5\r\nContent-type: text/html; charset=utf-8\r\n\r\n\r\nok"""


with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((HOST, PORT))
    s.listen()
    while True:
        conn, addr = s.accept()
        with conn:
            print("Connected by", addr)
            while True:
                req = bytes()
                data = conn.recv(BUFF_SIZE)
                print(data)
                print(len(data))
                req += data
                if len(data) < BUFF_SIZE:
                    break
            print(data.decode())
            conn.sendall(RESP)
            with open(f"{uuid.uuid1().hex}.req", "wb") as f:
                f.write(req)
            # conn.close()