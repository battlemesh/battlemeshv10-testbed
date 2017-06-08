rm -f topo.png
python parse_json.py
scp topo.png root@192.168.254.31:/usr/html/
