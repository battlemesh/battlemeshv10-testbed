#!/bin/bash

ROUTERS=$1 # file with router list

cat $ROUTERS | while read -r line
do
    # run test_one_failure here 
    # TODO: find the good counters and timers to run this sub-script
    ip=$line
    ./test_one_failure.sh $ROUTERS $ip
done

