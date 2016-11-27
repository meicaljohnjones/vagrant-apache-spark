#!/bin/bash


# VARIABLES
SPARK_URL="http://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-hadoop2.7.tgz"

# download Apache Spark
wget -O spark.tar.gz $SPARK_URL
tar xvf spark.tar.gz

# unpack hadoop config in home directory
tar xvf hadoop-config.tar.gz

# and set environment variable to point to id
echo export HADOOP_CONF_DIR="/home/vagrant/hadoop/" >> ~/.profile
source ~/.profile

# allow ssh to spark (local machine)
ssh-keyscan spark >> ~/.ssh/known_hosts

# allow ssh to hadoop
ssh-keyscan hadoop >> ~/.ssh/known_hosts
sshpass -p vagrant ssh-copy-id hadoop
exit 0
