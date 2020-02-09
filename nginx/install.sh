#!/bin/bash
#
# Description: Install Nginx on CentOS7
# Author: Gin Gu <bobo1314love@vip.qq.com>
# Version: 1.0.0
# Creation Time: 2020/02/09 20:37

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Generate Nginx repo
cat > /etc/yum.repos.d/nginx.repo << EOF
[nginx]
name=Nginx Stable
baseurl=http://nginx.org/packages/centos/7/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
EOF

# Make cache
yum makecache

# Install Nginx
yum install nginx -y