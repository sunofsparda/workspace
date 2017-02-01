#!/bin/bash
yum -y install java  > /dev/null 2>&1
iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
service iptables save
service iptables restart
wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.tar.gz -P /home/vagrant/ > /dev/null 2>&1
tar xf /home/vagrant/apache-tomcat-8.5.11.tar.gz  > /dev/null 2>&1
rm /home/vagrant/apache-tomcat-8.5.11.tar.gz
mkdir /apps
mv /home/vagrant/apache-tomcat-8.5.11 /apps/tomcat1
chown vagrant:vagrant /apps/ -R
chmod +x /apps/tomcat1/bin/startup.sh
runuser -l vagrant -c '/apps/tomcat1/bin/startup.sh'
#sudo c /home/vagrant/apps/tomcat1/bin/start.sh
