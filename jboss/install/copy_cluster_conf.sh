
cp ~/custom01/deploy/jbossweb.sar/server.xml /vagrant/install/cluster/custom01/deploy/jbossweb.sar/
cp ~/custom02/deploy/jbossweb.sar/server.xml /vagrant/install/cluster/custom02/deploy/jbossweb.sar/

cp ~/custom01/deploy/hsr-test.war/WEB-INF/web.xml /vagrant/install/cluster/custom01/deploy/hsr-test.war/WEB-INF/
cp ~/custom02/deploy/hsr-test.war/WEB-INF/web.xml /vagrant/install/cluster/custom02/deploy/hsr-test.war/WEB-INF/
     								           

cp ~/custom01/deploy/hsr-test.war/WEB-INF/jboss-web.xml /vagrant/install/cluster/custom01/deploy/hsr-test.war/WEB-INF/
cp ~/custom02/deploy/hsr-test.war/WEB-INF/jboss-web.xml /vagrant/install/cluster/custom02/deploy/hsr-test.war/WEB-INF/

cp ~/custom01/conf/props/myapp-* /vagrant/install/cluster/custom01/conf/props/
cp ~/custom02/conf/props/myapp-* /vagrant/install/cluster/custom02/conf/props/

cp /etc/httpd/conf/httpd.conf /vagrant/install/cluster/etc/httpd/conf/
cp /etc/httpd/conf/worker.properties /vagrant/install/cluster/etc/httpd/conf/

cp /etc/httpd/conf.d/mod_jk.conf /vagrant/install/cluster/etc/httpd/conf.d/
