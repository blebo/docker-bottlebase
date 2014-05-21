#!/usr/bin/env python
from bottle import route, run, default_app
@route('/')
def index():
    return "Hello from bottle with Python3 !"

if __name__ == "__main__":
    run(host="localhost", port=8081)
else:
    application = default_app()