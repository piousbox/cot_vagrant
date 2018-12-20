#!/bin/bash

##
## rbenv, ruby, ruby-build
##
cd /vagrant
git clone https://github.com/rbenv/rbenv.git .rbenv
cd .rbenv && src/configure && make -C src
echo 'export PATH="/vagrant/.rbenv/bin:$PATH"' >> ~/.bash_profile
/vagrant/.rbenv/bin/rbenv init
eval "$(rbenv init -)"
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv install 2.3.1
