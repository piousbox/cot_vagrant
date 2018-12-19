#!/bin/bash

set -x

cd microsites3 && bundle && bundle exec rails server --port 3000

