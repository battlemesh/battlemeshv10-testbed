#!/bin/bash

routers=$1 # file with router list

IP_LIST="\""
for i in `cat $routers`;
    do IP_LIST="$IP_LIST "$i;
done
IP_LIST=$IP_LIST"\""

echo "IPS=$IP_LIST" > /tmp/pingall.sh
cat pingall.sh >> /tmp/pingall.sh 

cat $routers | while read -r line
do
    ip="$line"
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip 'ash -s'< /tmp/pingall.sh  & 
    echo "sent pingall on router  $ip"
done
