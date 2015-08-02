#!/bin/bash

# Required:
# - mysql

set -e

# python install
sudo apt-get install -y python python-setuptools python-dev
sudo easy_install -U distribute
sudo apt-get install -y python-pip

# python mysql
# mysql server is required. install by:
# sudo apt-get install -y mysql-server
sudo apt-get install -y libmysqlclient-dev

# plot
sudo apt-get install -y python-matplotlib
