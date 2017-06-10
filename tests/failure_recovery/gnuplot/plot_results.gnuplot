set term png
set datafile separator ","

set xrange [-1:4]
set xtics ("9-2" 0, "9-17" 1, "8-2" 2, "8-17" 3)
set boxwidth 0.1

set xlabel "Paths"

set ylabel "delay"

#set output "../graphs/failure_test_delay-IPv4.png"
#set key left top
#plot "../parsed_data/OLSR-IPv4.txt" every ::1 u 0:5:7:8:5 with candlesticks title "OLSRv1" lw 3,\
#"../parsed_data/OLSR2-IPv4.txt" every ::1 u ($0+0.1):5:7:8:5 with candlesticks title "OLSRv2" lw 3,\
#"../parsed_data/BATMAN4-IPv4.txt" every ::1 u ($0+0.2):5:7:8:5 with candlesticks title "BATMAN4" lw 3,\
#"../parsed_data/BATMAN5-IPv4.txt" every ::1 u ($0+0.3):5:7:8:5 with candlesticks title "BATMAN5" lw 3,\
#"../parsed_data/BABEL-IPv4.txt" every ::1 u ($0+0.3):5:7:8:5 with candlesticks title "BABEL" lw 3
#
#set ylabel "loss"
#
#set key right top
#set title "IPv4"
#set output "../graphs/failure_test_loss-IPv4.png"
#set xtics ("9-17" 0, "9-2" 1, "8-17" 2, "8-2" 3)
#plot "../parsed_data/OLSR-IPv4.txt" every ::1 u 0:2 with boxes title "OLSRv1" lw 3,\
#"../parsed_data/OLSR2-IPv4.txt" every ::1 u ($0+0.1):3 with boxes title "OLSRv2" lw 3,\
#"../parsed_data/BATMAN4-IPv4.txt" every ::1 u ($0+0.2):3 with boxes title "BATMAN4" lw 3,\
#"../parsed_data/BATMAN5-IPv4.txt" every ::1 u ($0+0.3):3 with boxes title "BATMAN5" lw 3,\
#"../parsed_data/BABEL-IPv4.txt" every ::1 u ($0+0.4):3 with boxes title "BABEL" lw 3,\
#"../parsed_data/BMX7-IPv4.txt" every ::1 u ($0+0.5):3 with boxes title "BMX7" lw 3
#
#
#

set ylabel "delay (10percent-median-90percent)"
set title "IPv6"
set output "../graphs/failure_test_delay-IPv6.png"
plot "../parsed_data/OLSRv1-IPv6.txt" every ::1 u 0:5:7:8:5 with candlesticks title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6.txt" every ::1 u ($0+0.1):5:7:8:5 with candlesticks title "OLSRv2" lw 3,\
"../parsed_data/BATMAN4-IPv6.txt" every ::1 u ($0+0.2):5:7:8:5 with candlesticks title "BATMAN4" lw 3,\
"../parsed_data/BABEL-IPv6.txt" every ::1 u ($0+0.3):5:7:8:5 with candlesticks title "BABEL" lw 3,\
"../parsed_data/BMX7-IPv6.txt" every ::1 u ($0+0.4):5:7:8:5 with candlesticks title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6.txt" every ::1 u ($0+0.5):5:7:8:5 with candlesticks title "BMX7TUN" lw 3

set ylabel "loss"

set key right top
set output "../graphs/failure_test_loss-IPv6.png"
set xtics ("9-17" 0, "9-2" 1, "8-17" 2, "8-2" 3)
plot "../parsed_data/OLSRv1-IPv6.txt" every ::1 u 0:3 with boxes title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6.txt" every ::1 u ($0+0.1):3 with boxes title "OLSRv2" lw 3,\
"../parsed_data/BATMAN4-IPv6.txt" every ::1 u ($0+0.2):3 with boxes title "BATMAN4" lw 3,\
"../parsed_data/BATMAN5-IPv6.txt" every ::1 u ($0+0.3):3 with boxes title "BATMAN5" lw 3,\
"../parsed_data/BABEL-IPv6.txt" every ::1 u ($0+0.4):3 with boxes title "BABEL" lw 3,\
"../parsed_data/BMX7-IPv6.txt" every ::1 u ($0+0.5):3 with boxes title "BMX7" lw 3

set logscale
set xrange [1:100]
set xtics 20
set ylabel "Delay"
set key right top
set output "../graphs/failure_test_delay_distribution-IPv6-1.png"
plot "../parsed_data/OLSRv1-IPv6.txt" i 1 u 0:1 with lp title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6.txt" i 1 u 0:1 with lp title "OLSRv2" lw 3,\
"../parsed_data/BABEL-IPv6.txt" i 1 u 0:1 with lp title "BABEL" lw 3,\
"../parsed_data/BATMAN4-IPv6.txt" i 1 u 0:1 with lp title "BATMAN4" lw 3,\
"../parsed_data/BMX7-IPv6.txt" i 1 u 0:1 with lp title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6.txt" i 1 u 0:1 with lp title "BMX7TUN" lw 3

set output "../graphs/failure_test_delay_distribution-IPv6-2.png"
plot "../parsed_data/OLSRv1-IPv6.txt" i 1 u 0:2 with lp title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6.txt" i 1 u 0:2 with lp title "OLSRv2" lw 3,\
"../parsed_data/BABEL-IPv6.txt" i 1 u 0:2 with lp title "BABEL" lw 3,\
"../parsed_data/BATMAN4-IPv6.txt" i 1 u 0:2 with lp title "BATMAN4" lw 3,\
"../parsed_data/BMX7-IPv6.txt" i 1 u 0:2 with lp title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6.txt" i 1 u 0:2 with lp title "BMX7TUN" lw 3

set output "../graphs/failure_test_delay_distribution-IPv6-3.png"
plot "../parsed_data/OLSRv1-IPv6.txt" i 1 u 0:3 with lp title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6.txt" i 1 u 0:3 with lp title "OLSRv2" lw 3,\
"../parsed_data/BABEL-IPv6.txt" i 1 u 0:3 with lp title "BABEL" lw 3,\
"../parsed_data/BATMAN4-IPv6.txt" i 1 u 0:3 with lp title "BATMAN4" lw 3,\
"../parsed_data/BMX7-IPv6.txt" i 1 u 0:3 with lp title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6.txt" i 1 u 0:3 with lp title "BMX7TUN" lw 3


set output "../graphs/failure_test_delay_distribution-IPv6-4.png"
plot "../parsed_data/OLSRv1-IPv6.txt" i 1 u 0:1 with lp title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6.txt" i 1 u 0:1 with lp title "OLSRv2" lw 3,\
"../parsed_data/BABEL-IPv6.txt" i 1 u 0:1 with lp title "BABEL" lw 3,\
"../parsed_data/BATMAN4-IPv6.txt" i 1 u 0:1 with lp title "BATMAN4" lw 3,\
"../parsed_data/BMX7-IPv6.txt" i 1 u 0:1 with lp title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6.txt" i 1 u 0:1 with lp title "BMX7TUN" lw 3

unset logscale
set xrange [-1:3]
set xtics ("8-17" 0.25, "9-2" 1.25)
set ylabel "Transmitted Data"
set key outside right

set output "../graphs/failure_test_iperf-IPv6.png"
plot "../parsed_data/OLSRv1-IPv6-iperf.txt" i 0 u 0:3 with p title "OLSRv1" lw 3,\
"../parsed_data/OLSRv2-IPv6-iperf.txt" i 0 u ($0+0.1):3 with p title "OLSRv2" lw 3,\
"../parsed_data/BABEL-IPv6-iperf.txt" i 0 u ($0+0.2):3 with p title "BABEL" lw 3,\
"../parsed_data/BMX7-IPv6-iperf.txt" i 0 u ($0+0.3):3 with p title "BMX7" lw 3,\
"../parsed_data/BMX7TUN-IPv6-iperf.txt" i 0 u ($0+0.4):3 with p title "BMX7TUN" lw 3,\
"../parsed_data/BATMAN4-IPv6-iperf.txt" i 0 u ($0+0.5):3 with p title "BATMAN4" lw 3,\
"../parsed_data/BATMAN5-IPv6-iperf.txt" i 0 u ($0+0.6):3 with p title "BATMAN5" lw 3




