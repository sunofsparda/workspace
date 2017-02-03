#!/bin/bash

# restoring httpd webserver backups
/bin/cp /vagrant/backup/httpd.conf /etc/httpd/conf/
/bin/cp /vagrant/backup/vhost.conf /etc/httpd/conf.d/
/bin/cp /vagrant/backup/workers.properties /etc/httpd/conf.d/

# restoring logs directory rights
chown tomcat:tomcat /opt/apache/tomcat/7.0.62/logs/

# removing custom environments for java and catalina in .bashrc from tomcat home directory
sed -i 's/export JAVA_HOME/#export JAVA_HOME/g' /home/tomcat/.bashrc
sed -i 's/export CATALINA_HOME/#export CATALINA_HOME/g' /home/tomcat/.bashrc


# restoring write access to iptables
chattr -i /etc/sysconfig/iptables
# adding rules to iptables
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
# enabling firewall to save rules when stoping or restarting
sed -i 's/IPTABLES_SAVE_ON_STOP="no"/IPTABLES_SAVE_ON_STOP="yes"/g' /etc/sysconfig/iptables-config
sed -i 's/IPTABLES_SAVE_ON_RESTART="no"/IPTABLES_SAVE_ON_RESTART="yes"/g' /etc/sysconfig/iptables-config
service iptables restart

# update to the highest priority installed java
#alternatives --auto java

# set java home	
alternatives --set java /opt/oracle/java/x64//jdk1.7.0_79/bin/java

# removing output to /dev/null from Tomcat init.d script 
sed -i '/success/d' /etc/init.d/tomcat
sed -i 's/> \/dev\/null//g' /etc/init.d/tomcat

# restarting httpd webserver
service httpd restart

# enabling and starting tomcat service
chkconfig tomcat on
service tomcat start
