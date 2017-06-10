set term png
set datafile separator ","

set xrange [-1:4]
set xtics ("9-2" 0, "9-17" 1, "8-2" 2, "8-17" 3)
set boxwidth 0.1

set xlabel "Paths"

set xrange [-1:3]
set xtics ("8-17" 0.25, "9-2" 2.25)
set title "Transmitted Data, 10 iperf sessions (10s each), one flow 5Mb (14->10)"
set ylabel "Bytes (10percent-median-90percent)"
set key outside right

set output "../graphs/failure_test_iperf_10runs-IPv6-fiveflows.png"
plot "../parsed_data/OLSRv1-IPv6-iperf-fiveflows.txt" i 0 u ($0*2):3:4:5:6 with candlesticks title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6-iperf-fiveflows.txt" i 0 u ($0*2+0.1):3:4:5:6 with candlesticks title "OLSRv2" lw 3,\
"../parsed_data/OLSRv2_MPR-IPv6-iperf-fiveflows.txt" i 0 u ($0*2+0.2):3:4:5:6 with candlesticks title "OLSRv2_{MPR}" lw 3,\
"../parsed_data/BABEL-IPv6-iperf-fiveflows.txt" i 0 u ($0*2+0.3):3:4:5:6 with candlesticks title "BABEL" lw 3,\
"../parsed_data/BMX7-IPv6-iperf-fiveflows.txt" i 0 u ($0*2+0.4):3:4:5:6 with candlesticks title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6-iperf-fiveflows.txt" i 0 u ($0*2+0.5):3:4:5:6 with candlesticks title "BMX7TUN" lw 3,\
"../parsed_data/BATMAN4-IPv6-iperf-fiveflows.txt" i 0 u ($0*2+0.6):3:4:5:6 with candlesticks title "BATMAN4" lw 3,\
"../parsed_data/BATMAN5-IPv6-iperf-fiveflows.txt" i 0 u ($0*2+0.7):3:4:5:6 with candlesticks title "BATMAN5" lw 3




