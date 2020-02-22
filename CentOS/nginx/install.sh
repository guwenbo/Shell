#!/bin/bash
#
# Description: Install Nginx on CentOS
# Author: Gin Gu <bobo1314love@vip.qq.com>
# Version: 1.0.0
# Creation Time: 2020/02/09 20:37

set -e
export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# CentOS Base Release Version
BASE_RELEASE=$(rpm -q centos-release | cut -d - -f 3)

# Generate Nginx repo
sudo cat > /etc/yum.repos.d/nginx.repo << EOF
[nginx]
name=Nginx Stable
baseurl=http://nginx.org/packages/centos/${BASE_RELEASE}/$(arch)/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
EOF

# Make cache
sudo yum makecache fast

# Install Nginx
sudo yum install nginx -y

# Start Nginx
sudo systemctl start nginx