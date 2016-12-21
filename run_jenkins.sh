#!/usr/bin/env bash

docker-compose up -d
docker exec articlepuppetdocker_repo_1 /opt/puppet-agent.sh
docker exec articlepuppetdocker_repo_1 /usr/bin/createrepo /opt/repo

# Test
EXIT=0
for env in dev prod
do
    echo "Launch container"
    docker run -h app1.docker.$env -d --cap-add=SYS_ADMIN --name puppet_test_1 -e FACTER_environment="${env}" --link articlepuppetdocker_master_1 --link articlepuppetdocker_repo_1 --network articlepuppetdocker_default xebia/puppet-agent
    echo "Execute puppet"
    docker exec puppet_test_1 puppet agent -t
    RETURN=$?
    if [ $RETURN -ne 2 ] && [ $RETURN -ne 0 ]
    then
    	echo "Fail in puppet run ${env}."
    	EXIT=1
    else
        echo "Success in puppet run ${env}."
    fi
    echo "Stop container"
    docker stop puppet_test_1
    echo "Rm container"
    docker rm -v puppet_test_1
done
