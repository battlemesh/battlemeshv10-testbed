DEST=$1
DATAFILE="/tmp/failuretest-"`hostname`-"$DEST.txt"
rm -f $DATAFILE
PING_NUM=5
rm -f $DATAFILE
ping -q -n -c $PING_NUM  $DEST > /tmp/pingout.txt
cat /tmp/pingout.txt | awk -v host=$DEST '/packet loss/ {if ($7 != "0.0%") print host, $7}' >> $DATAFILE
cat /tmp/pingout.txt | awk -F '/' '{print $5}' >> $DATAFILE
