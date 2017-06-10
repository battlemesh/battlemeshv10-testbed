#!/bin/bash

for directory in $(find ../iperf-data-with-two-flows/ -type 'd'); do
    folder=$(basename $directory)
    echo $folder
    ./parse_iperf.py ../iperf-data-with-two-flows/$folder/failuretest-iperf-node > ../parsed_data/$folder-IPv6-twoflow.txt
done
