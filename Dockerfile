

FROM ubuntu:14.04
MAINTAINER blebo

RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe' > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y nginx-full

RUN apt-get install -y uwsgi-plugin-python3 uwsgi

RUN apt-get install -y python3-pip

# Install virtualenv for python3 to avoid installing python2.7.
RUN pip3 install virtualenv
RUN echo "blah"

# set-up
RUN mkdir -p /var/www/bottlebase
ADD . /var/www/bottlebase/


RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default

RUN ln -s /var/www/bottlebase/nginx_bottlebase /etc/nginx/sites-enabled/
RUN ln -s /var/www/bottlebase/uwsgi_bottlebase.ini /etc/uwsgi/apps-enabled/

RUN chown -R www-data:www-data /var/www/bottlebase
RUN chmod 755 /var/www

# Set-up virtualenv
RUN mkdir /opt/venv
RUN virtualenv /opt/venv/bottlebase -p python3

RUN /opt/venv/bottlebase/bin/pip install bottle
#RUN deactivate

RUN chown -R www-data:www-data /opt/venv/bottlebase

# add

# Remove default nginx site config.



#EXPOSE 80



# to avoid error from uwsgi service start:
#
#RUN ln -s /proc/self/fd /dev/fd

CMD ln -s /proc/self/fd /dev/fd; service uwsgi restart; nginx