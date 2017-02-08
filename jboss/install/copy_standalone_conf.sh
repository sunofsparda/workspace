
cp ~/custom/deploy/jbossweb.sar/server.xml /vagrant/install/standalone/custom/deploy/jbossweb.sar/server.xml

cp ~/custom/deploy/hsr-test.war/WEB-INF/web.xml /vagrant/install/standalone/custom/deploy/hsr-test.war/WEB-INF/
cp ~/custom/deploy/hsr-test.war/WEB-INF/jboss-web.xml /vagrant/install/standalone/custom/deploy/hsr-test.war/WEB-INF/

cp ~/custom/conf/props/myapp-* /vagrant/install/standalone/custom/conf/props/

cp /etc/httpd/conf/httpd.conf /vagrant/install/standalone/etc/httpd/conf/
cp /etc/httpd/conf/worker.properties /vagrant/install/standalone/etc/httpd/conf/

cp /etc/httpd/conf.d/mod_jk.conf /vagrant/install/standalone/etc/httpd/conf.d/
