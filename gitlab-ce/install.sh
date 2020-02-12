#!/bin/bash
#
# Description: Install Gitlab-CE on CentOS
# Author: Gin Gu <bobo1314love@vip.qq.com>
# Version: 1.0.0
# Creation Time: 2020/02/08 22:06

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Generate Gitlab-CE repo
cat > /etc/yum.repos.d/gitlab-ce.repo << EOF
[gitlab-ce]
name=Gitlab CE
enabled=1
baseurl=https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el$releasever/
gpgcheck=0
EOF

# Make cache
yum makecache

# Install Gitlab-CE
yum install gitlab-ce -y

# Configure and Start Gitlab
gitlab-ctl reconfigure