This project creates a Ubuntu 14.04 (trusty) docker container image which
includes the following stack:

- Ubuntu 14.04
- nginx
- uwsgi
- Python 3.4
- virtualenv
- bottlepy

This environment is based on the original instructions from
http://www.tengiz.net/bootlepy-nginx-uwsgi-python3-with-virtualenv-on-debian/


To Build:
  docker build -t bottlebase .

To Run:
  docker run -d -p 80:80 bottlebase
