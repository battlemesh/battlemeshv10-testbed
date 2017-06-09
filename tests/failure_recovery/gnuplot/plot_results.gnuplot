set term png
set datafile separator ","

set xrange [-1:4]
set xtics ("9-2" 0, "9-17" 1, "8-2" 2, "8-17" 3)
set boxwidth 0.1

set xlabel "Paths"

set ylabel "delay"

set output "../graphs/failure_test_delay-IPv4.png"
set key left top
plot "../parsed_data/OLSR-IPv4.txt" every ::1 u 0:5:4:6:5 with candlesticks title "OLSRv1" lw 3,\
"../parsed_data/OLSR2-IPv4.txt" every ::1 u ($0+0.1):5:4:6:5 with candlesticks title "OLSRv2" lw 3,\
"../parsed_data/BATMAN4-IPv4.txt" every ::1 u ($0+0.2):5:4:6:5 with candlesticks title "BATMAN4" lw 3,\
"../parsed_data/BATMAN5-IPv4.txt" every ::1 u ($0+0.3):5:4:6:5 with candlesticks title "BATMAN5" lw 3

set ylabel "loss"

set key right top
set title "IPv4"
set output "../graphs/failure_test_loss-IPv4.png"
set xtics ("9-2" 0, "9-17" 1, "8-2" 2, "8-17" 3)
plot "../parsed_data/OLSR-IPv6.txt" every ::1 u 0:2 with boxes title "OLSRv1" lw 3,\
"../parsed_data/OLSR2-IPv6.txt" every ::1 u ($0+0.1):3 with boxes title "OLSRv2" lw 3,\
"../parsed_data/BATMAN4-IPv6.txt" every ::1 u ($0+0.2):3 with boxes title "BATMAN4" lw 3,\
"../parsed_data/BATMAN5-IPv6.txt" every ::1 u ($0+0.3):3 with boxes title "BATMAN5" lw 3,\
"../parsed_data/BABEL-IPv6.txt" every ::1 u ($0+0.4):3 with boxes title "BABEL" lw 3,\
"../parsed_data/BMX7-IPv6.txt" every ::1 u ($0+0.5):3 with boxes title "BMX7" lw 3



set ylabel "delay"

set output "../graphs/failure_test_delay-IPv6.png"
plot "../parsed_data/OLSR-IPv6.txt" every ::1 u 0:5:4:6:5 with candlesticks title "OLSRv1" lw 3,\
"../parsed_data/OLSR2-IPv6.txt" every ::1 u ($0+0.1):5:4:6:5 with candlesticks title "OLSRv2" lw 3,\
"../parsed_data/BATMAN4-IPv6.txt" every ::1 u ($0+0.2):5:4:6:5 with candlesticks title "BATMAN4" lw 3,\
"../parsed_data/BATMAN5-IPv6.txt" every ::1 u ($0+0.3):5:4:6:5 with candlesticks title "BATMAN5" lw 3

set ylabel "loss"

set key right top
set title "IPv6"
set output "../graphs/failure_test_loss-IPv6.png"
set xtics ("9-2" 0, "9-17" 1, "8-2" 2, "8-17" 3)
plot "../parsed_data/OLSR-IPv6.txt" every ::1 u 0:2 with boxes title "OLSRv1" lw 3,\
"../parsed_data/OLSR2-IPv6.txt" every ::1 u ($0+0.1):3 with boxes title "OLSRv2" lw 3,\
"../parsed_data/BATMAN4-IPv6.txt" every ::1 u ($0+0.2):3 with boxes title "BATMAN4" lw 3,\
"../parsed_data/BATMAN5-IPv6.txt" every ::1 u ($0+0.3):3 with boxes title "BATMAN5" lw 3,\
"../parsed_data/BABEL-IPv6.txt" every ::1 u ($0+0.4):3 with boxes title "BABEL" lw 3,\
"../parsed_data/BMX7-IPv6.txt" every ::1 u ($0+0.5):3 with boxes title "BMX7" lw 3

