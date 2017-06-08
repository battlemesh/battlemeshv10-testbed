#!/bin/bash

DEADNODE=$2 # IP address of the node to kill
DATAFILE="/tmp/failuretest.txt"

rm -f /tmp/pids.txt
# test addresses
#LEFT_NODES="192.168.254.8 192.168.254.9"
#RIGHT_NODES="10.0.17.1 10.0.2.1"

LEFT_NODES="192.168.254.8 192.168.254.9"
RIGHT_NODES="fc00:17::1 fc00:2::1"


# Run the script in each node with a ssh session in bg 
for sip in $LEFT_NODES; 
do
   for dip in $RIGHT_NODES; do
        ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$sip 'ash -s'< ./pingall.sh $dip  & 
        echo $! >> /tmp/pids.txt
        echo "sent pingall on router $sip"
   done
done

# kill one node
#echo | ssh root@$DEADNODE reboot

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
for sip in $LEFT_NODES; 
do
    scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$sip:/tmp/failuretest* data/
done
