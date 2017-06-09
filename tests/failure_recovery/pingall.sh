DEST=$1
DATAFILE="/tmp/failuretest-"`hostname`-"$DEST.txt"
PINGOUT="/tmp/pingout-$DEST.txt"
PING_NUM=100
ping -n -c $PING_NUM  $DEST > $PINGOUT
ENTRIES=$(grep "bytes from" $PINGOUT | awk '{printf $7}' |sed 's/time=/ /g')
echo "entries = $ENTRIES" > $DATAFILE
cat $PINGOUT | grep "packet loss" | awk '{printf("loss = %s\n", $7)}' >> $DATAFILE
cat $PINGOUT | grep "round-trip" | awk -F '/' '{printf($3)}' | awk -F "=" '{printf("min = %s\n",$2)}' >> $DATAFILE
cat $PINGOUT | grep "round-trip" | awk -F '/' '{printf("avg = %s\n", $4)}' >> $DATAFILE
cat $PINGOUT | grep "round-trip" | awk -F '/' '{printf("max = %s\n", $5)}' >> $DATAFILE

#IPERFOUT="/tmp/failuretest-iperf-"`hostname`"-$DEST.csv"
#iperf -f M -y C -t 10 -e -V -c $DEST | tail -n 2 > $IPERFOUT
