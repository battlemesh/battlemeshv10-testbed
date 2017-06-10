#!/bin/env python2
import glob
from collections import defaultdict
import numpy as np
import sys


data_path = sys.argv[1]+"*txt"

file_list = glob.glob(data_path)

data = defaultdict(dict)

for f in file_list:
    tokens0 = f.split("/")
    tokens1 = tokens0[-1]
    tokens = tokens1.split("-")
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
            if "entries" in entry:
                data[s][d]['entries'] = [float(x)  for x in entry.split("=")[1].split()]

print "source, dest, loss, min_rtt, median_rtt, max_rtt, 10_percent, 90_percent "
for s in data:
    for d, numbers in data[s].items():
        print s, ",", d, ",",
        if 'loss' in numbers:
            print numbers['loss'], ",",
        else:
            print ",",
        if 'min' in numbers:
            print numbers['min'], ",",
        else:
            print ",",
        if 'entries' in numbers:
            print np.percentile(numbers['entries'], 50), ",",
        else:
            print ",",
        #if 'avg' in numbers:
        #    print numbers['avg'], ",",
        #else:
        #    print ",",
        if 'max' in numbers:
            print numbers['max'], ",",
        else:
            print ",",
        if 'entries' in numbers:
            print np.percentile(numbers['entries'], 10), ",",
            print np.percentile(numbers['entries'], 90), ",",
        else:
            print ",,",
        print ""


print ""
print ""
ranked_data = {}
max_length = 0
for s in data:
    for d, numbers in data[s].items():
        ranked_data[s+d] = sorted(numbers['entries'], reverse=True)
        if max_length < len(ranked_data[s+d]):
            max_length = len(ranked_data[s+d])


for i in range(max_length):
    for k in ranked_data:
        try:
            print ranked_data[k][i], ",",
        except IndexError:
            print ",",
    print ""



