set term png
set datafile separator ","

set xrange [-1:4]
set xtics ("9-2" 0, "9-17" 1, "8-2" 2, "8-17" 3)
set boxwidth 0.1


set xrange [-1:9]
set title "Transmitted Data, 10 iperf, Airtime Fairness on (dash)/off (dot)"
set ylabel "Bytes (10percent-median-90percent)"
set key outside right
delta=0.4
lambda=0.18
step=5
set xtics ("8-17" 1.5, "9-2" 1.5+step)

set output "../graphs/failure_test_iperf_10runs-IPv6_noairfair.png"
plot "../parsed_data/OLSRv1-IPv6-iperf-noairfair.txt" i 0 u ($0*step +delta):3:4:5:6 with candlesticks  title "OLSRv1" lc 1 lw 3,\
"../parsed_data/OLSRv2-IPv6-iperf-noairfair.txt" i 0 u ($0*step +2*delta):3:4:5:6 with candlesticks title "OLSRv2" lc 2 lw 3,\
"../parsed_data/OLSRv2_MPR-IPv6-iperf-noairfair.txt" i 0 u ($0*step+3*delta):3:4:5:6 with candlesticks title "OLSRv2_{MPR}" lc 3 lw 3,\
"../parsed_data/BABEL-IPv6-iperf-noairfair.txt" i 0 u ($0*step+4*delta):3:4:5:6 with candlesticks title "BABEL" lc 4 lw 3,\
"../parsed_data/BMX7-IPv6-iperf-noairfair.txt" i 0 u ($0*step+5*delta):3:4:5:6 with candlesticks title "BMX7" lc 5 lw 3,\
"../parsed_data/BMX7TUN-IPv6-iperf-noairfair.txt" i 0 u ($0*step+6*delta):3:4:5:6 with candlesticks title "BMX7TUN" lc 6  lw 3,\
"../parsed_data/BATMAN4-IPv6-iperf-noairfair.txt" i 0 u ($0*step+7*delta):3:4:5:6 with candlesticks title "BATMAN4" lc 7 lw 3,\
"../parsed_data/OLSRv1-IPv6-iperf-noairfair.txt" i 0 u ($0*step +delta):6 with p  title "" lc 1 pt 7 lt 1,\
"../parsed_data/OLSRv2-IPv6-iperf-noairfair.txt" i 0 u ($0*step +2*delta):6 with p title "" lc 2 pt 7 lt 1,\
"../parsed_data/OLSRv2_MPR-IPv6-iperf-noairfair.txt" i 0 u ($0*step+3*delta):6 with p title "" lc 3 pt 7 lt 1,\
"../parsed_data/BABEL-IPv6-iperf-noairfair.txt" i 0 u ($0*step+4*delta):6 with p title "" lc 4  pt 7 lt 1,\
"../parsed_data/BMX7-IPv6-iperf-noairfair.txt" i 0 u ($0*step+5*delta):6 with p title "" lc 5  pt 7 lt 1,\
"../parsed_data/BMX7TUN-IPv6-iperf-noairfair.txt" i 0 u ($0*step+6*delta):6 with p title "" lc 6  pt 7 lt 1,\
"../parsed_data/BATMAN4-IPv6-iperf-noairfair.txt" i 0 u ($0*step+7*delta):6 with p title "" lc 7  pt 7 lt 1,\
"../parsed_data/OLSRv1-IPv6-iperf.txt" i 0 u ($0*step+delta+lambda):3:4:5:6 with candlesticks title "" lc 1 lw 3,\
"../parsed_data/OLSRv2-IPv6-iperf.txt" i 0 u ($0*step+2*delta+lambda):3:4:5:6 with candlesticks title "" lc 2 lw 3,\
"../parsed_data/OLSRv2_MPR-IPv6-iperf.txt" i 0 u ($0*step+3*delta+lambda):3:4:5:6 with candlesticks title "" lc 3 lw 3,\
"../parsed_data/BABEL-IPv6-iperf.txt" i 0 u ($0*step+4*delta+lambda):3:4:5:6 with candlesticks title "" lc 4 lw 3,\
"../parsed_data/BMX7-IPv6-iperf.txt" i 0 u ($0*step+5*delta+lambda):3:4:5:6 with candlesticks title "" lc 5 lw 3,\
"../parsed_data/BMX7TUN-IPv6-iperf.txt" i 0 u ($0*step+6*delta+lambda):3:4:5:6 with candlesticks title "" lc 6 lw 3,\
"../parsed_data/BATMAN4-IPv6-iperf.txt" i 0 u ($0*step+7*delta+lambda):3:4:5:6 with candlesticks title "" lc 7 lw 3
