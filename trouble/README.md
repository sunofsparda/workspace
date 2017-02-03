# The website is down

|| ISSUE | HOW TO FIND | TIME TO FIND | HOW TO FIX | TIME TO FIX
--- | --- | --- | --- |---| ---  
1 | Going to $SERVER_IP, getting redirect to http://mntlab | 1) Check server config files: <br> `cat /etc/httpd/conf/httpd.conf` |5| Remove *redirect* directive with entire *VirtualHost* block, we have it in *vhost.conf*| 20m 
2 | Requests are going to httpd only, not forwarding to tomcat server | 1) Check mod_jk log <br> `cat /var/log/httpd/modjk.log` <br> 2) Check virtual host and workers config files:  <br> `cat /etc/httpd/conf.d/vhost.conf` <br> Log file says that Tomcat is not started or listening on wrong port. And worker name is wrong. <br> `cat /etc/httpd/conf.d/workers.properties` | 5m |  Edit *VirtualHost* directive in *vhost.conf* <br> Fix wrong worker name and ip/port in *workers.properties*   | 50m
3 | qwe | qwe | qwe | qwe | qwe 







Additional Questions:
What java version is installed? java -verion
How was it installed and configured? yum install java
Where are log files of tomcat and httpd? 
tomcat: /opt/apache/tomcat/logs/
httpd: /var/log/httpd/
Where is JAVA_HOME and what is it?
JAVA_HOME it is varaible and it stores java home location, /
Where is tomcat installed?
What is CATALINA_HOME?
What users run httpd and tomcat processes? How is it configured?
What configuration files are used to make components work with each other?
What does it mean: “load average: 1.18, 0.95, 0.83”?
