|| ISSUE | HOW TO FIND | TIME TO FIND | HOW TO FIX | TIME TO FIX
--- | --- | --- | --- |---| ---  
1 | The website is down | 1) Check that webserver (apache httpd) is running : <br> `netstat -tulpan` <br> 2) Check server config files: <br> `cat /etc/httpd/conf/httpd.conf` <br> `cat /etc/httpd/conf.d/vhost.conf` <br> `cat /etc/httpd/conf.d/workers.properties`   |  60 | Remove <VirtualHost> block, because we have it at  | qwerty 
2 | qwe | qwe | qwe | qwe | qwe 
3 | qwe | qwe | qwe | qwe | qwe 







Additional Questions:
What java version is installed?
How was it installed and configured?
Where are log files of tomcat and httpd?
Where is JAVA_HOME and what is it?
Where is tomcat installed?
What is CATALINA_HOME?
What users run httpd and tomcat processes? How is it configured?
What configuration files are used to make components work with each other?
What does it mean: “load average: 1.18, 0.95, 0.83”?
