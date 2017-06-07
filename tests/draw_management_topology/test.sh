#!/bin/bash

routers=$1 # file with router list

IP_LIST="\""
for i in `cat $routers`;
    do IP_LIST="$IP_LIST "$i;
done
IP_LIST=$IP_LIST"\""

echo "IPS=$IP_LIST" > /tmp/pingall.sh
cat pingall.sh >> /tmp/pingall.sh 

declare -a PIDS


cat $routers | while read -r line
do
    ip="$line"
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip 'ash -s'< /tmp/pingall.sh  & 
    PIDS+={"$!"}   
    echo "sent pingall on router  $ip"
done

for p in $PID; do
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


echo "collcting datafiles from routers"
cat $routers | while read -r line
do
    ip="$line"
    scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip:/tmp/pingtest.txt data/pingall-$ip.txt
done



