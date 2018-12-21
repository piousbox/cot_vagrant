#!/usr/bin/env bash

locale-gen UTF-8

##
## ubuntu setup
##
apt-get update -y
apt-get install -y git tree vim build-essential \
  libssl-dev libreadline-dev zlib1g-dev \
  autogen autoconf libtool

##
## user setup
##
# echo "alias ll='ls -lah '" >> /home/vagrant/.bashrc
# echo "alias be='bundle exec '" >> /home/vagrant/.bashrc
echo "alias ll='ls -lah '" >> /home/vagrant/.bash_profile
echo "alias be='bundle exec '" >> /home/vagrant/.bash_profile
cp scripts/tmpl/_screenrc /home/vagrant/.screenrc

##
## node
##
cd /opt && \
wget http://nodejs.org/dist/v0.10.31/node-v0.10.31-linux-x64.tar.gz && \
tar zxf node-v0.10.31-linux-x64.tar.gz && \
ln -s /opt/node-v0.10.31-linux-x64/bin/node /usr/local/bin/node && \
ln -s /opt/node-v0.10.31-linux-x64/bin/node-waf /usr/local/bin/node-waf && \
ln -s /opt/node-v0.10.31-linux-x64/bin/npm /usr/local/bin/npm


##
## mongodb
##
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
apt-get update && \
apt-get install mongodb-org=2.6.4 mongodb-org-server=2.6.4 mongodb-org-shell=2.6.4 mongodb-org-mongos=2.6.4 mongodb-org-tools=2.6.4 && \
echo "mongodb-org hold" | dpkg --set-selections && \
echo "mongodb-org-server hold" | dpkg --set-selections && \
echo "mongodb-org-shell hold" | dpkg --set-selections && \
echo "mongodb-org-mongos hold" | dpkg --set-selections && \
echo "mongodb-org-tools hold" | dpkg --set-selections && \
sed -i '/bind_ip = 127.0.0.1/,/bind_ip\ =\ 127\.0\.0\.1/s/^/#/' /etc/mongod.conf && \
service mongod restart


