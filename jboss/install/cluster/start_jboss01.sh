#!/bin/bash
nohup /opt/jboss/bin/run.sh -Djboss.server.home.dir=/home/vagrant/custom01 -Djboss.server.home.url=file:/home/vagrant/custom01 -b 127.0.0.1 -Djboss.messaging.ServerPeerID=1 >> /home/vagrant/jboss_log/jboss_custom01.log &
