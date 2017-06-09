#!/bin/sh

# here we generate a list of random node-pairs
# out of our IP-list and store that into the file './test1_ip_pairs'
# later we iterate over that list, starting a data-transmission
# and measuring the transfered bytes. this is done for each protocol.

FILE_IPLIST="${1:-./routers}"
OUT='./test1_ip_pairs.txt'

random_integer()
{
	local start="${1:-0}"
	local end="${2:-256}"
	local seed diff random out

	seed="$( hexdump -n 2 -e '/2 "%u"' /dev/urandom )"      # e.g. 0...65536
	[ $end -gt 65536 ] && seed=$(( seed * seed ))

	diff=$(( end + 1 - start ))
	[ ${diff:-0} -gt 0 ] || diff=1	# happens with input start=1 end=0
	random=$(( seed % diff ))       # result: integer somewhere between 0...$diff - divisor_valid
	out=$(( start + random ))

	echo "${out:-$start}"
}

get_random_ip()
{
	local i=1
	local max="$( wc -l <"$FILE_IPLIST" )"
	local random="$( random_integer 1 $max )"
	local line

	while read -r line; do
		ip="$line"
		[ $i -eq $random ] && break
		i=$(( i + 1 ))
	done <"$FILE_IPLIST"

	echo "$ip"
}

MAX=100
I=1

while [ $I -lt $MAX ]; do
	IP1="$( get_random_ip )"
	IP2="$( get_random_ip )"
	[ "$IP1" = "$IP2" ] || {
		echo "$IP1 $IP2"
		I=$(( I + 1 ))
	}
done >"$OUT"
