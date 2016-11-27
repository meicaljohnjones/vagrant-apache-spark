#!/bin/bash

# install:
#    - java 7 (OpenJDK will work)
#    - sshpass (so we can pass a password to ssh-copy-id)
sudo apt-get update -y
sudo apt-get install -y openjdk-7-jdk sshpass

# set JAVA_HOME
echo export JAVA_HOME=$(dirname $(dirname $(dirname $(readlink -f $(which java))))) | sudo tee --append ~/.profile
echo export JAVA_HOME=$(dirname $(dirname $(dirname $(readlink -f $(which java))))) | sudo tee --append /etc/environment
source ~/.profile

echo "
127.0.0.1    localhost
192.168.33.10    hadoop
192.168.33.11    spark
"| sudo tee /etc/hosts

# create and copy the public ssh id so we can ssh to 'localhost'
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
ssh-keyscan localhost >> ~/.ssh/known_hosts
ssh-keyscan 0.0.0.0 >> ~/.ssh/known_hosts

exit 0
