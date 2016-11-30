#!/bin/bash

`curl pm.docker:8140 &> /dev/null`
while [ $? -ne 56 ]
do
  echo try connection to pm
  sleep 5
  `curl pm.docker:8140 &> /dev/null`
done

/usr/bin/puppet agent -t &>> /var/log/puppet/puppet.log

