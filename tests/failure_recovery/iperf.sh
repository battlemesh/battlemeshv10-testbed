DEST=$1

if [ $2 == 1 ];
	then
	rm /tmp/failuretest-iperf-*;
	fi
IPERFOUT="/tmp/failuretest-iperf-"`hostname`"-$DEST.csv"
iperf -f M -y C -t 20 -e -V -c $DEST | tail -n 2 >> $IPERFOUT
