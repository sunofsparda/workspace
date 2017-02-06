#!/bin/bash
nohup /opt/jboss/bin/run.sh -Djboss.server.home.dir=/home/vagrant/custom -Djboss.server.home.url=file:/home/vagrant/custom -b 192.168.33.10 >> /home/custom/jboss_log/jboss.log