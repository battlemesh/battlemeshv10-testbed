DEST=$1
iperf -t 600 -V -b 5M -c $DEST  >> /dev/null
