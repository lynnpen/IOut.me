#!/bin/bash

wget https://pypi.python.org/packages/source/t/tornado/tornado-4.2.1.tar.gz

tar xvzf tornado-4.2.1.tar.gz
cd tornado-4.2.1
python setup.py build
sudo python setup.py install
