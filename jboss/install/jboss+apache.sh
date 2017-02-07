vi ~/custom/deploy/jbossweb.sar/server.xml
### Change ports to:
# <!-- A HTTP/1.1 Connector on port 8080 -->
# <Connector protocol="HTTP/1.1" port="9090"
# <!-- A AJP 1.3 Connector on port 8009 --> 
# <Connector protocol="AJP/1.3" port="9091"

vi ~/custom/deploy/hsr-test.war/WEB-INF/jboss-web.xml
### comment context-root
<!--                                                                       
        <context-root>/changed-context</context-root>                                          
-->    
#####################################################


vi ~/custom/deploy/jbossweb.sar/server.xml
### Uncomment to enable request dumper

tail custom/log/localhost_access_log.2017-02-07.log








#### 1.6. Configure Apache HTTP server listen on port 8080 forwarding all requests to AJP connector on localhost:9091


### install mod_jk.so !DO NOT DO THIS ON ENTERPRISE!
yum -y install httpd perl perl-CGI autoconf libtool gcc pcre-devel
wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz
tar xf tomcat-connectors-1.2.42-src.tar.gz
cd tomcat-connectors-1.2.42-src/native
./buildconf.sh 
./configure --with-apxs=/usr/bin/apxs
make
#cp ./apache-2.0/mod_jk.so /apps/apache/modules/
#cp ./apache-2.0/mod_jk.so /usr/lib/httpd/modules/
#cp ./apache-2.0/mod_jk.so /usr/lib64/httpd/modules/
cp ./apache-2.0/mod_jk.so /etc/httpd/modules/



### httpd.conf add
# httpd.conf
Listen 8080

Include conf.d/*.conf
Include conf.modules.d/*.conf
# /httpd.conf


vi /etc/httpd/conf.d/mod_jk.conf

# mod_jk.conf
LoadModule jk_module  /etc/httpd/modules/mod_jk.so

JkWorkersFile /etc/httpd/conf/worker.properties
JkLogFile /var/log/httpd/mod_jk.log
JkLogLevel info
JkLogStampFormat "[%a %b %d %H:%M:%S %Y] "
JkOptions +ForwardKeySize +ForwardURICompat -ForwardDirectories
JkRequestLogFormat "%w %V %T"
JkMount /* jbossA
# /mod_jk.conf


vi /etc/httpd/conf/worker.properties

# worker.properties
worker.list=jbossA

worker.jbossA.port=9091
worker.jbossA.host=localhost
worker.jbossA.type=ajp13
worker.jbossA.lbfactor=1
# /worker.properties


#### 3.1. Configure JBoss HTTP connector to handle HTTPS traffic and using HTTP basic authentication

