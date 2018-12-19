#!/bin/bash

echo "What is your github username?"
read github_username
echo $github_username > ./config/github_username

mkdir -p ./tmp

git clone git@github.com:$github_username/microsites3.git
git clone git@github.com:$github_username/ish_models.git

## mongo data
# rm -rf ./tmp/dump
# tar -xvzf backups/20181219_mongodb_vagrant.tar.gz > ./tmp
# mongorestore --drop ./tmp/dump
# rm -rf ./tmp/dump

