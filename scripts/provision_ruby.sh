#!/bin/bash

set -x

export home=/home/vagrant

export rbenv_root=$home/.rbenv
rm -rf $rbenv_root
git clone https://github.com/rbenv/rbenv.git $rbenv_root
cd $rbenv_root
./src/configure
make -C src
echo 'export PATH="$rbenv_root/bin:$PATH"' >> $home/.bashrc
export PATH="/vagrant/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
mkdir -p "$($rbenv_root/bin/rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git $rbenv_root/plugins/ruby-build
RUBY_CONFIGURE_OPTS=--disable-install-doc rbenv install 2.3.1
