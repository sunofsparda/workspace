# The website is down

|   | ISSUE | HOW TO FIND | TIME TO FIND | HOW TO FIX | TIME TO FIX
--- | --- | --- | --- |---| ---  
1 | Going to $SERVER_IP, getting redirect to http://mntlab | 1) Check server config files: <br> `cat /etc/httpd/conf/httpd.conf` |5m| Remove **redirect** directive with entire *VirtualHost* block, we have it in **vhost.conf**| 20m 
2 | Requests are going to httpd only, not forwarding to tomcat server | 1) Check virtual host config file:  <br> `cat /etc/httpd/conf.d/vhost.conf` | 5m |  Edit **VirtualHost** directive in **vhost.conf**, change address to * , to enable bind on all interfaces | 50m
3 | Recieving error page | 1) Checking site with `curl` and getting 503 error. Tomcat unavailible. <br> 2) Check Tomcat is running <br> `netstat -tulpan` <br> there are no java services that listening to 8005,8080 ports | 20m | Start Tomcat server <br> `service tomcat start` | 1m
4 | Still recieving error page | Check Tomcat is running and listening ports <br> `service tomcat status` <br> Output: tomcat is running <br> `netstat -tulpan` <br> Not listening. <br> Check Tomcat init script. <br> Someone forwarded output to **/dev/null** and added **success** result to all cases. So if script won't start output always will be **success** | 80m | Fix init script by removing **> /dev/null** and **success** <br> Start Tomcat <br> `service tomcat start` | 60m
5 | Recieving error "Cannot find /tmp/bin/setclasspath.sh" when starting Tomcat | Start Tomcat manually. Look for dependencies. <br> Tomcat runs from **tomcat** user, and **tomcat** has custom environment variables | 100m | Removing custom environments. Starting Tomcat. | 10m
6 | Catalina haven't got access /opt/apache/tomcat/7.0.62/logs/ | Check permissions on **logs** <br> `ls -la /opt/apache/tomcat/7.0.62/` | 50m | Restore rights on **logs** <br> `chown tomcat:tomcat /opt/apache/tomcat/7.0.62/logs/` <br> `service tomcat start` | 10m
7 | Service tomcat is running but the page shows errors | Check java alternatives. <br> `alternatives --config java` | 40m | Change java alternatives to needed one | 10m
8 | Service tomcat is running on 8080 but it not redirecting to 80 |  Check mod_jk log <br> `cat /var/log/httpd/modjk.log` <br> And could not find a worker for **worker name=tomcat.worker** <br> `cat /etc/httpd/conf.d/workers.properties`  | 60m |  <br> Fix wrong worker name and ip/port in *workers.properties*   | 60m
9 | Nothing working after reboot | Check **tomcat** service is enabled <br> `chkconfig` | 30m | `chkconfig tomcat on` | 15m


Additional Questions:

What java version is installed? 
java -verion

How was it installed and configured? 
yum install java

Where are log files of tomcat and httpd? 

tomcat: /opt/apache/tomcat/logs/

httpd: /var/log/httpd/

Where is JAVA_HOME and what is it?

JAVA_HOME it is varaible and it stores Java runtime environment location

Where is tomcat installed?
tomcat : /opt/apache/tomcat/7.0.62/

What is CATALINA_HOME?
The variable CATALINA_HOME is a configuration property that stores the location of the Catalina files.

What users run httpd and tomcat processes? How is it configured?
ps -ef | grep httpd
ps -ef | grep tomcat

What configuration files are used to make components work with each other?
workers.properties vhost.conf 

What does it mean: “load average: 1.18, 0.95, 0.83”?
The load average represents the average system load over a period of time.
