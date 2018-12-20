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

git clone git@github.com:$github_username/microsites3.git
git clone git@github.com:$github_username/ish_models.git
cd /vagrant/microsites3
sudo gem install bundler --no-ri --no-rdoc
$rbenv_root/shims/bundle

##
## mongo data
##
# mkdir -p ./tmp
# rm -rf ./tmp/dump
# tar -xvzf backups/20181219_mongodb_vagrant.tar.gz > ./tmp
# mongorestore --drop ./tmp/dump
# rm -rf ./tmp/dump

