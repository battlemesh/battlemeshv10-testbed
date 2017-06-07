MAX_NODES=15
PING_NUM=5
DEST_FILE="192.168.254.16"

outfile="/tmp/"`hostname`"-ping.txt"

rm -f $outfile

for i in $IPS;
    do ping -c 5 -q $i; # just let 11s converge
    ping -c $PING_NUM -q $i >> $outfile;
    echo "" >> $outfile;
done
