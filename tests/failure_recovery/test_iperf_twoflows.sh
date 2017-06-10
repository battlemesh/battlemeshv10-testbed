#!/bin/bash

OUTFOLDER=$1 # IP address of the node to kill
DATAFILE="/tmp/failuretest.txt"

rm -f /tmp/pids.txt
# test addresses
LEFT_NODES="192.168.254.8 192.168.254.9"

NODES1="192.168.254.8"
NODES2="192.168.254.9"
NODED1="fc00:17::1"
NODED2="fc00:2::1"

NOISENODES1="192.168.254.14"
NOISENODED1="fc00:10::1"

ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$NOISENODES1 'ash -s'< ./one_noise_flow.sh $NOISENODED1 &

NOISEPID1=$!

NOISENODES2="192.168.254.4"
NOISENODED2="fc00:15::1"

ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$NOISENODES2 'ash -s'< ./one_noise_flow.sh $NOISENODED2 &

NOISEPID2=$!

NOISENODES3="192.168.254.1"
NOISENODED3="fc00:16::1"

ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$NOISENODES3 'ash -s'< ./one_noise_flow.sh $NOISENODED3 &

NOISEPID3=$!


NOISENODES4="192.168.254.12"
NOISENODED4="fc00:11::1"

ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$NOISENODES4 'ash -s'< ./one_noise_flow.sh $NOISENODED4 &

NOISEPID4=$!


#NOISENODES5="192.168.254.12"
#NOISENODED5="fc00:11::1"
#
#ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$NOISENODES4 'ash -s'< ./one_noise_flow.sh $NOISENODED4 &
#
#NOISEPID5=$!




# Run the script in each node with a ssh session in bg 
for st in 1 2 3 4 5 6 7 8 9 10
do
	ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$NODES1 'ash -s'< ./iperf.sh $NODED1 $st &
	echo $! >> /tmp/pids.txt
	ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$NODES2 'ash -s'< ./iperf.sh $NODED2 $st &
	echo $! >> /tmp/pids.txt
	sleep 20
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

kill -9 $NOISEPID1 $NOISEPID2 $NOISEPID3 $NOISEPID4 $NOISEPID5

# collect the datafiles from the routers
echo "collcting datafiles from routers"
for sip in $LEFT_NODES; 
do
    scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$sip:/tmp/failuretest* data/$OUTFOLDER
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$sip rm /tmp/failuretest*
done
