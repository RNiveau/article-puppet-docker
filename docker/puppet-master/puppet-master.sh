#!/bin/bash

for i in `/usr/bin/puppet cert list --all | grep -v pm.dev | grep -v Notice | cut -f 2 -d '"'`
do
    if [ ! -z $i ]
    then
        echo delete $i certificat
        /usr/bin/puppet cert clean $i
    fi
done

/usr/bin/puppet master --no-daemonize --verbose