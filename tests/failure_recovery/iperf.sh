DEST=$1

IPERFOUT="/tmp/failuretest-iperf-"`hostname`"-$DEST.csv"
iperf -f M -y C -t 10 -e -V -c $DEST | tail -n 2 > $IPERFOUT
