PING_NUM=1
DEST_FILE="192.168.254.16"

outfile="/tmp/pingtest.txt"

rm -f $outfile

for i in $IPS;
    do ping -c 2 -q $i; # just let 11s converge
    ping -c $PING_NUM -q $i >> $outfile;
    echo "" >> $outfile;
done
