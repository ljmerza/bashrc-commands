# https://realpython.com/python-sockets/

# socket module:
# socket()
# bind()
# listen()
# accept()
# connect()
# connect_ex()
# send()
# recv()
# close()
# 
# 
# open socket with socket.socket()
# socket.SOCK_STREAM TCP
# socket.SOCK_DGRAM UDP
# 
# listn() for connectionb once established use aapect() to accept it
# client calls connect() to establish connection
# send() and recv() used to communicate
# 
# 
# use select() for context switching on same thread
# asyncio module for threads/processes
# 
# 
# create custom headers to allow efficient sockets
# byteorder	The byte order of the machine (uses sys.byteorder). This may not be required for your application.
# content-length	The length of the content in bytes.
# content-type	The type of content in the payload, for example, text/json or binary/my-binary-type.
# content-encoding	The encoding used by the content, for example, utf-8 for Unicode text or binary for binary data.