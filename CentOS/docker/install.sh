#!/bin/bash
#
# Description: Install Docker-CE on CentOS
# Author: Gin Gu <bobo1314love@vip.qq.com>
# Version: 1.0.0
# Creation Time: 2020/02/16 15:03

set -e
export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install required packages
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Set up repo
sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# Make cache
sudo yum makecache fast

# Install Docker-CE
sudo yum install docker-ce -y

# Enable Docker-CE
sudo systemctl enable docker

# Start Docker-CE
sudo systemctl start docker