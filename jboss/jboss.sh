mkdir -p /opt/oracle/jdk
chmod +x /vagrant/soft/jdk-6u45-linux-x64.bin
cd /opt/oracle/jdk
/vagrant/soft/jdk-6u45-linux-x64.bin
ln -s /opt/oracle/jdk/jdk1.6.0_45/ /opt/oracle/jdk/current
update-alternatives --install /usr/bin/java java /opt/oracle/jdk/current/bin/java 1

