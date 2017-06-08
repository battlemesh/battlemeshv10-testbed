#!/bin/bash

routers=$1 # file with router list

IP_LIST="\""
for i in `cat $routers`;
    do IP_LIST="$IP_LIST "$i;
done
IP_LIST=$IP_LIST"\""

echo "IPS=$IP_LIST" > /tmp/pingall.sh
cat pingall.sh >> /tmp/pingall.sh 

PIDS=""

rm -f /tmp/pids.txt

cat $routers | while read -r line
do
    ip="$line"
    #ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip 'ash -s'< sleep 10  & 
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip 'ash -s'< /tmp/pingall.sh  & 
    echo $! >> /tmp/pids.txt
    echo "sent pingall on router  $PIDS"
done


for p in `cat /tmp/pids.txt`; do
    echo "waiting for PID" $p
    while [ 1 ]; do
        sleep 1;
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



echo "collcting datafiles from routers"
cat $routers | while read -r line
do
    ip="$line"
    scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip:/tmp/pingtest.txt data/pingall-$ip.txt
done
