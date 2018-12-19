#!/bin/bash

set -x

cd /vagrant/microsites3 && bundle && bundle exec rails server --port 3000

