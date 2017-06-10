set term png
set datafile separator ","

set xrange [-1:4]
set xtics ("9-2" 0, "9-17" 1, "8-2" 2, "8-17" 3)
set boxwidth 0.1

set xlabel "Paths"
set ylabel "msec (10percent-median-90percent)"
set title "Ping Delay (100 pings)"

set output "../graphs/failure_test_delay-IPv6.png"
plot "../parsed_data/OLSRv1-IPv6-ping.txt" every ::1 u 0:5:7:8:5 with candlesticks title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6-ping.txt" every ::1 u ($0+0.1):5:7:8:5 with candlesticks title "OLSRv2" lw 3,\
"../parsed_data/OLSRv2_MPR-IPv6-ping.txt" every ::1 u ($0+0.2):5:7:8:5 with candlesticks title "OLSRv2_{MPR}" lw 3,\
"../parsed_data/BATMAN4-IPv6-ping.txt" every ::1 u ($0+0.3):5:7:8:5 with candlesticks title "BATMAN4" lw 3,\
"../parsed_data/BABEL-IPv6-ping.txt" every ::1 u ($0+0.4):5:7:8:5 with candlesticks title "BABEL" lw 3,\
"../parsed_data/BMX7-IPv6-ping.txt" every ::1 u ($0+0.5):5:7:8:5 with candlesticks title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6-ping.txt" every ::1 u ($0+0.6):5:7:8:5 with candlesticks title "BMX7TUN" lw 3


set title "Packet Loss"
set ylabel "Loss percent"
set key right top
set output "../graphs/failure_test_loss-IPv6.png"
set xtics ("9-17" 0, "9-2" 1, "8-17" 2, "8-2" 3)
plot "../parsed_data/OLSRv1-IPv6-ping.txt" i 0 every ::1 u 0:3 with boxes title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6-ping.txt" i 0 every ::1 u ($0+0.1):3 with boxes title "OLSRv2" lw 3,\
"../parsed_data/BATMAN4-IPv6-ping.txt" i 0 every ::1 u ($0+0.2):3 with boxes title "BATMAN4" lw 3,\
"../parsed_data/BATMAN5-IPv6-ping.txt" i 0 every ::1 u ($0+0.3):3 with boxes title "BATMAN5" lw 3,\
"../parsed_data/BABEL-IPv6-ping.txt" i 0 every ::1 u ($0+0.4):3 with boxes title "BABEL" lw 3,\
"../parsed_data/BMX7-IPv6-ping.txt" i 0 every ::1 u ($0+0.5):3 with boxes title "BMX7" lw 3

set logscale
set xrange [1:100]
set xtics 20
set title "Flow 1"
set xlabel ""
set ylabel "Delay"
set key right top
set output "../graphs/failure_test_delay_distribution-IPv6-1.png"
plot "../parsed_data/OLSRv1-IPv6-ping.txt" i 1 u 0:1 with lp title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6-ping.txt" i 1 u 0:1 with lp title "OLSRv2" lw 3,\
"../parsed_data/BABEL-IPv6-ping.txt" i 1 u 0:1 with lp title "BABEL" lw 3,\
"../parsed_data/BATMAN4-IPv6-ping.txt" i 1 u 0:1 with lp title "BATMAN4" lw 3,\
"../parsed_data/BMX7-IPv6-ping.txt" i 1 u 0:1 with lp title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6-ping.txt" i 1 u 0:1 with lp title "BMX7TUN" lw 3

set title "Flow 2"
set output "../graphs/failure_test_delay_distribution-IPv6-2.png"
plot "../parsed_data/OLSRv1-IPv6-ping.txt" i 1 u 0:2 with lp title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6-ping.txt" i 1 u 0:2 with lp title "OLSRv2" lw 3,\
"../parsed_data/BABEL-IPv6-ping.txt" i 1 u 0:2 with lp title "BABEL" lw 3,\
"../parsed_data/BATMAN4-IPv6-ping.txt" i 1 u 0:2 with lp title "BATMAN4" lw 3,\
"../parsed_data/BMX7-IPv6-ping.txt" i 1 u 0:2 with lp title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6-ping.txt" i 1 u 0:2 with lp title "BMX7TUN" lw 3

set title "Flow 3"
set output "../graphs/failure_test_delay_distribution-IPv6-3.png"
plot "../parsed_data/OLSRv1-IPv6-ping.txt" i 1 u 0:3 with lp title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6-ping.txt" i 1 u 0:3 with lp title "OLSRv2" lw 3,\
"../parsed_data/BABEL-IPv6-ping.txt" i 1 u 0:3 with lp title "BABEL" lw 3,\
"../parsed_data/BATMAN4-IPv6-ping.txt" i 1 u 0:3 with lp title "BATMAN4" lw 3,\
"../parsed_data/BMX7-IPv6-ping.txt" i 1 u 0:3 with lp title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6-ping.txt" i 1 u 0:3 with lp title "BMX7TUN" lw 3


set title "Flow 4"
set output "../graphs/failure_test_delay_distribution-IPv6-4.png"
plot "../parsed_data/OLSRv1-IPv6-ping.txt" i 1 u 0:1 with lp title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6-ping.txt" i 1 u 0:1 with lp title "OLSRv2" lw 3,\
"../parsed_data/BABEL-IPv6-ping.txt" i 1 u 0:1 with lp title "BABEL" lw 3,\
"../parsed_data/BATMAN4-IPv6-ping.txt" i 1 u 0:1 with lp title "BATMAN4" lw 3,\
"../parsed_data/BMX7-IPv6-ping.txt" i 1 u 0:1 with lp title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6-ping.txt" i 1 u 0:1 with lp title "BMX7TUN" lw 3
