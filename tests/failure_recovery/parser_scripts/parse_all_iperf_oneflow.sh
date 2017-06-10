#!/bin/bash
for folder in BABEL  BATMAN4  BATMAN5  BMX7  BMX7TUN  OLSRv1  OLSRv2  OLSRv2_MPR; do
    ./parse_iperf.py ../iperf-data-with-one-flow/$folder/failuretest-iperf-node > ../parsed_data/$folder-IPv6-iperf-oneflow.txt
done

