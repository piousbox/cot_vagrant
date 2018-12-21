#!/bin/bash

set -x

export home=/vagrant
export rbenv_root=/home/vagrant/.rbenv
cd $home

if [ ! -f /vagrant/.config/github_username ]; then
  echo "need your github username in .config/github_username"
  exit 5
fi

export github_username=`cat $home/.config/github_username`
echo $github_username
ssh-keyscan github.com >> ~/.ssh/known_hosts

sudo gem install bundler --no-ri --no-rdoc
mkdir -p /home/vagrant/.bundle
cp scripts/tmpl/_bundle_config /home/vagrant/.bundle/config

git clone git@github.com:$github_username/microsites3.git
git clone git@github.com:$github_username/ish_models.git
git clone git@github.com:$github_username/ishapi.git
git clone git@github.com:$github_username/ish_manager.git

cd /vagrant/microsites3
$rbenv_root/shims/bundle

cp $home/.config/s3.txt ./config/initializers/00_s3.rb
cp config/mongoid.yml-example config/mongoid.yml

##
## mongo data
##
# mkdir -p ./tmp
# rm -rf ./tmp/dump
# tar -xvzf backups/20181219_mongodb_vagrant.tar.gz > ./tmp
# mongorestore --drop ./tmp/dump
# rm -rf ./tmp/dump

