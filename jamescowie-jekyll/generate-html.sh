#!/bin/bash

set -e

cd /data

bundle install
bundle exec jekyll build

