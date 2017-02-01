#!/bin/bash
yum -y install nginx  > /dev/null 2>&1
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
service iptables save
service iptables restart
rm /etc/nginx/conf.d/*.conf
cp  /vagrant/install/nginx/nginx.conf /etc/nginx/nginx.conf
cp  /vagrant/install/nginx/proxy.conf /etc/nginx/conf.d/proxy.conf
chkconfig nginx on
service nginx start
