#!/bin/bash

HADOOP_VER="hadoop-2.7.3"
HADOOP_URL="http://www.mirrorservice.org/sites/ftp.apache.org/hadoop/common/${HADOOP_VER}/${HADOOP_VER}.tar.gz"
# make directories for hdfs
mkdir -p var/data/hadoop/hdfs
mkdir -p var/data/hadoop/hdfs/nn
mkdir -p var/data/hadoop/hdfs/snn
mkdir -p var/data/hadoop/hdfs/dn

wget -O hadoop.tar.gz $HADOOP_URL
tar xvf hadoop.tar.gz

# replace config directory
cd $HADOOP_VER/etc
rm -rf hadoop
# and copy the config directory in its place
tar xvf ~/hadoop-config.tar.gz

# format hdfs
~/$HADOOP_VER/bin/hdfs namenode -format

# start services
~/$HADOOP_VER/sbin/start-dfs.sh
~/$HADOOP_VER/sbin/start-yarn.sh

# allow ssh to hadoop (local machine)
ssh-keyscan hadoop >> ~/.ssh/known_hosts


exit 0
