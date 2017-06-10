#!/bin/bash

for directory in $(find ../iperf-data-without-noise/ -type 'd'); do
    folder=$(basename $directory)
    echo $folder
    ./parse_ping.py ../delay-one-run/$folder/ > ../parsed_data/$folder-IPv6-ping.txt
done

