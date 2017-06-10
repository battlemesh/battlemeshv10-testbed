import json
import networkx as nx
import matplotlib.pyplot as plt
import os

# Use this to get the topology from somewhere in the management network
#addresses = [
#        '192.168.254.10',
#        '192.168.254.1',
#        '192.168.254.2',
#        '192.168.254.3',
#        '192.168.254.4',
#        '192.168.254.5']
#
#os.system('rm NetworkGraph')
#for i in addresses:
#    if not os.system("wget 192.168.254.10:2005/NetworkGraph"):
#        break
#

g = nx.DiGraph()

with open('NetworkGraph-10dbm.json') as json_data:
    d = json.load(json_data)

for node in d['nodes']:
    g.add_node(node['id'])

for link in d['links']:
    g.add_edge(link['source'], link['target'], {'weight': link['cost']})

paths = {}

for source, path in nx.shortest_path(g, weight="weight").items():
    for dest in path:
        weight = 0
        currpath = path[dest]
        if len(currpath) > 1:
            for idx, n in enumerate(path[dest][:-1]):
                weight += g[currpath[idx]][currpath[idx+1]]["weight"]
            s = source.split(".")[3]
            d = dest.split(".")[3]
            label = source.split(".")[3]+"-"+dest.split(".")[3] 
            paths[label] = [len(currpath), weight]
x = []
y = []
for p in sorted(paths.items(), key=lambda x: -x[1][0]):
    #    label = "-"
    x.append(p[0])
    y.append(p[1][1])

xticks = []
for v in x:
    if v == "9-2" or v == "8-2" or v == "9-17" or v == "8-17":
        xticks.append(v)
    else:
        xticks.append("")
plt.plot(range(len(x)), y)
plt.ylabel("ETX path cost")
plt.xlabel("Shortest Path")
plt.xticks(range(len(x)), xticks, rotation='vertical')
plt.savefig('route_lenght_distribution.png')
