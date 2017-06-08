#!/bin/env python
import glob
from collections import defaultdict

data_path = "../data/failure*"

file_list = glob.glob(data_path)

data = defaultdict(dict)

for f in file_list:
    tokens = f.split("-")
    s = tokens[1]
    d = '.'.join(tokens[2].split(".")[:-1])
    data[s][d] = {}
    with open(f) as data_file:
        content = data_file.readlines()
        for entry in content:
            if "loss" in entry:
                data[s][d]['loss'] = int(entry.split()[-1][:-1])
            if "max" in entry:
                data[s][d]['max'] = float(entry.split("=")[1].split()[0])
            if "min" in entry:
                data[s][d]['min'] = float(entry.split("=")[1])
            if "avg" in entry:
                data[s][d]['avg'] = float(entry.split("=")[1])

print "source, dest, loss, min_rtt, avg_rtt, max_rtt"
for s in data:
    for d, numbers in data[s].items():
        print s, ",", d, ",",
        if 'loss' in numbers:
            print numbers['loss'], ",",
        else:
            print "",
        if 'min' in numbers:
            print numbers['min'], ",",
        else:
            print "",
        if 'avg' in numbers:
            print numbers['avg'], ",",
        else:
            print "",
        if 'max' in numbers:
            print numbers['max'],
        else:
            print "",
        print ""


