#!/bin/bash

for folder in $(ls -Fd ../delay-one-run/* | grep '/$' | awk -F '/' '{print $(NF-1)}'); do
    echo $folder
    ./parse_ping.py ../delay-one-run/$folder/ > ../parsed_data/$folder-IPv6-ping.txt
done

