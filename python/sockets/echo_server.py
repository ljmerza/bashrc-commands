#!/usr/bin/env python3


import socket

HOST = '127.0.0.1'
PORT = 65432

# open socket as a IP4 TCP stream
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
	s.bind((HOST, PORT)) # bind socket with network interface and port
	s.listen()
	conn, addr = s.accept() # accept() BLOCKS and waits for an incoming connection

	with conn:
		print(f'connected by {addr}')
		while True:
			data = conn.recv(1024)
			if not data:
				break
			conn.sendall(data) # send data back to client