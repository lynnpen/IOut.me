#!/bin/bash

set -e

ssh_file_name="github"
user_name="Jackon Yang"
user_email="jiekunyang@gmail.com"


# Required:
# nothing


# env clean
rm -f ~/.ssh/$ssh_file_name
rm -f ~/.ssh/$ssh_file_name.pub


# install and config git
sudo apt-get install -y git-all
git config --global user.name $user_name
git config --global user.email $user_email


# ssh keys
mkdir -p ~/.ssh && cd ~/.ssh
(sleep 1; echo $ssh_file_name) | ssh-keygen -t rsa -C $user_email


# add private key
ssh-add ~/.ssh/$ssh_file_name


# add public key to github manually
echo '------------------------------------------------'
cat ~/.ssh/$ssh_file_name.pub
echo '------------------------------------------------'

echo add ssh keys above to github page https://github.com/settings/ssh
echo and run test CMD:
echo ssh -T git@github.com
# output
# Hi JackonYang! You have successfully authenticated, but GitHub does not provide shell access.
