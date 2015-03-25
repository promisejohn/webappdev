#!/usr/bin/env bash

# install and config nginx
apt-get update
apt-get install -y nginx
if ! [ -L /var/www ]; then
	rm -rf /usr/share/nginx/html
	ln -fs /vagrant/html /usr/share/nginx/html
fi
if ! [ -L /etc/nginx ]; then
	rm -rf /etc/nginx
	ln -fs /vagrant/conf/nginx /etc/nginx
fi

# config python, install setuptools
wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python
sudo easy_install pip

# install and config webframeworks
sudo pip install flask
sudo apt-get install -y uwsgi uwsgi-plugin-python

# config uwsgi
if ! [ -L /etc/uwsgi ]; then
	rm -rf /etc/uwsgi
	ln -fs /vagrant/conf/uwsgi /etc/uwsgi
fi
