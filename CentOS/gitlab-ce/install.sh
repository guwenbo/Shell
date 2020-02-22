#!/bin/bash
#
# Description: Install Gitlab-CE on CentOS
# Author: Gin Gu <bobo1314love@vip.qq.com>
# Version: 1.0.0
# Creation Time: 2020/02/08 22:06

set -e
export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# CentOS Base Release Version
BASE_RELEASE=$(rpm -q centos-release | cut -d - -f 3)

# Generate Gitlab-CE repo
sudo cat > /etc/yum.repos.d/gitlab-ce.repo << EOF
[gitlab-ce]
name=Gitlab CE
enabled=1
baseurl=https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el${BASE_RELEASE}/
gpgcheck=0
EOF

# Make cache
sudo yum makecache fast

# Install Gitlab-CE
sudo yum install gitlab-ce -y

# Configure and Start Gitlab
sudo gitlab-ctl reconfigure