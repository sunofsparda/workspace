#!/bin/bash
yum -y install java  > /dev/null
iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
service iptables save
service iptables restart
wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.tar.gz -P /home/vagrant/ > /dev/null
tar xf /home/vagrant/apache-tomcat-8.5.11.tar.gz  > /dev/null
rm /home/vagrant/apache-tomcat-8.5.11.tar.gz
mkdir /apps
mv /home/vagrant/apache-tomcat-8.5.11 /apps/tomcat1
chown vagrant:vagrant /apps/ -R
chmod +x /apps/tomcat1/bin/startup.sh
runuser -l vagrant -c '/apps/tomcat1/bin/startup.sh'
echo "runuser -l vagrant -c '/apps/tomcat1/bin/startup.sh'" >> /etc/rc.local
