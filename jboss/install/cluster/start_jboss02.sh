#!/bin/bash
nohup /opt/jboss/bin/run.sh -Djboss.server.home.dir=/home/vagrant/custom02 -Djboss.server.home.url=file:/home/vagrant/custom02 -b 192.168.33.10 -Djboss.messaging.ServerPeerID=2 >> /home/vagrant/jboss_log/jboss_custom02.log &
