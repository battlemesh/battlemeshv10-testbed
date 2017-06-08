#!/bin/bash

ROUTERS=$1 # file with router list
DEADNODE=$2 # IP address of the node to kill
DATAFILE="/tmp/failuretest.txt"

IP_LIST="\""
for i in `cat $ROUTERS`;
    do IP_LIST="$IP_LIST "$i;
done
IP_LIST=$IP_LIST"\""

echo "IPS=$IP_LIST" > /tmp/failuretest.sh

cat pingall.sh >> /tmp/failuretest.sh

rm -f /tmp/pids.txt

# Run the script in each node with a ssh session in bg 
cat $ROUTERS | while read -r line
do
    ip="$line"
    if [ "$ip" != "$DEADNODE" ]; then
        ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip 'ash -s'< /tmp/failuretest.sh  & 
        echo $! >> /tmp/pids.txt
        echo "sent pingall on router  $PIDS"
    fi;
done

# kill one node
echo | ssh root@$DEADNODE reboot

# wait for all the SSH to exit
for p in `cat /tmp/pids.txt`; do
    echo "waiting for PID" $p
    while [ 1 ]; do
        sleep 0.1;
        if ps -p $p > /dev/null;
        then
            continue
        else
            echo "pid "$p "exited"
            break
        fi;
    done;
done;

echo "DONE!"

# collect the datafiles from the routers
echo "collcting datafiles from routers"
cat $ROUTERS | while read -r line
do
    ip="$line"
    if [ "$ip" != "$DEADNODE" ]; then
        scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip:$DATAFILE data/failuretest-$ip-$DEADNODE.txt
    fi;
done
