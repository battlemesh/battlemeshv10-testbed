DEST=$1
rm -f /tmp/failuretest*.txt
DATAFILE="/tmp/failuretest-"`hostname`-"$DEST.txt"
PING_NUM=100
ping -q -n -c $PING_NUM  $DEST > /tmp/pingout.txt
ENTRIES=$(grep "bytes from" /tmp/pingout.txt | awk '{printf $7}' |sed 's/time=/ /g')
echo "entries = $ENTRIES" >> $DATAFILE
cat /tmp/pingout.txt | grep "packet loss" | awk '{printf("loss = %s\n", $7)}' >> $DATAFILE
cat /tmp/pingout.txt | grep "round-trip" | awk -F '/' '{printf($3)}' | awk -F "=" '{printf("min = %s\n",$2)}' >> $DATAFILE
cat /tmp/pingout.txt | grep "round-trip" | awk -F '/' '{printf("avg = %s\n", $4)}' >> $DATAFILE
cat /tmp/pingout.txt | grep "round-trip" | awk -F '/' '{printf("max = %s\n", $5)}' >> $DATAFILE
