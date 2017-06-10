DEST=$1

IPERFOUT="/tmp/failuretest-iperf-"`hostname`"-"'timestamp'"-$DEST.csv"
iperf -f M -y C -t 20 -e -V -c $DEST | tail -n 2 >> $IPERFOUT
