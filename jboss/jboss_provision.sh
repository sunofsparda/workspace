### Task1
mkdir -p /opt/oracle/jdk
chmod +x /vagrant/soft/jdk-6u45-linux-x64.bin
cd /opt/oracle/jdk
#/vagrant/soft/jdk-6u45-linux-x64.bin
ln -s /opt/oracle/jdk/jdk1.6.0_45/ /opt/oracle/jdk/current
update-alternatives --install /usr/bin/java java /opt/oracle/jdk/current/bin/java 1
mv jboss-as/ /opt/jboss
mv mod_cluster/ picketlink/ resteasy/ seam/ jboss_addon/
mkdir ~/jboss_addon
cp -R /opt/jboss/server/all ~/custom
# vi custom/conf/props/jmx-console-users.properties ### uncomment admin=admin

#### INFO twiddle http://middlewaremagic.com/jboss/?p=726
/opt/jboss/bin/twiddle.sh -s localhost:1099 -u admin -p admin get "jboss.system:type=ServerInfo"
/opt/jboss/bin/twiddle.sh -s localhost:1099 -u admin -p admin get "jboss.system:type=ServerConfig"



### Task2

#shutdown jboss
./shutdown.sh -s 192.168.33.10 -u admin -p admin -S

 cp -R /opt/jboss/server/all/deploy/admin-console.war ~/custom/deploy/

