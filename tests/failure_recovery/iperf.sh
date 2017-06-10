DEST=$1
IPERFOUT="/tmp/failuretest-iperf-"`hostname`"-$DEST.csv"

if [ $2 == 1 ];
	then
	rm $IPERFOUT;
	fi
iperf -f M -y C -t 10 -e -V -c $DEST | tail -n 2 >> $IPERFOUT
