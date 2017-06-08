PING_NUM=1
DATAFILE="/tmp/failuretest.txt"
RUNS=3
rm -f $DATAFILE

for i in `seq 1 $RUNS`; do
    for d in $IPS; do
        echo "pinging $d"
        ping -q -n -c $PING_NUM  $d |
            awk -v host=$d '/packet loss/ {if ($7 != "0.0%") print host, $7}' >> $DATAFILE
    done;
done;
