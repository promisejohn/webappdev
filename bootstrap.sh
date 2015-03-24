#!/usr/bin/env bash

apt-get update
apt-get install -y nginx
if ! [ -L /var/www ]; then
	rm -rf /usr/share/nginx/html
	ln -fs /vagrant/html /usr/share/nginx/html
fi
