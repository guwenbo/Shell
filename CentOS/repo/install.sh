#!/bin/bash
#
# Description: Update Yum Repo to Aliyun
# Author: Gin Gu <bobo1314love@vip.qq.com>
# Version: 1.0.0
# Creation Time: 2020/02/16 13:06

set -e
export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# CentOS Base Release Version
BASE_RELEASE=$(rpm -q centos-release | cut -d - -f 3)

# Backup Base Repo
sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

# Download corresponding repo
sudo curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${BASE_RELEASE}.repo

# Make cache
sudo yum makecache fast