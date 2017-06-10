#!/bin/bash

for directory in $(find ../iperf-data-without-noise/ -type 'd'); do
    folder=$(basename $directory)
    echo $folder
    ./parse_iperf.py ../iperf-data-without-noise/$folder/failuretest-iperf-node > ../parsed_data/$folder-IPv6-iperf.txt
done

