#!/usr/bin/env python2
import glob
from collections import defaultdict
import sys
import numpy as np


data_path = sys.argv[1]+"*csv"
file_list = glob.glob(data_path)
data = defaultdict(dict)

for ff in file_list:
    f = open(ff)
    data_list = []
    for d in f.readlines():
        data = d.split(",")
        s = data[1]
        d = data[3]
        data_list.append(float(data[-1][:-1]))

    print s, ",", d, ",", np.percentile(data_list, 50), ",", np.percentile(data_list, 10), ",", np.percentile(data_list,90), ",", np.percentile(data_list, 50)
