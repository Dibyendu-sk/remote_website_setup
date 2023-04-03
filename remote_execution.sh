#! /bin/bash

USER='devops'

for HOST in `cat remote_hosts`
do
        echo "Connecting to $HOST...."
        echo "----------------------------------"
        echo "Pushing the script to $HOST"
        echo "----------------------------------"
        scp ../multiOs_setup.sh $USER@$HOST:/tmp/
        echo "Executing the script on host"
        echo "----------------------------------"
        ssh $USER@$HOST sudo /tmp/multiOs_setup.sh
        echo "Removing the temporary Files..."
        echo "-----------------------------------"
        ssh $USER@$HOST sudo rm -rf /tmp/multiOS_setup.sh
done
