#!/bin/sh

FILE="$1"
# for each protocol, cut out the data manually
# like this and run this script:

# protocol: batman-adv-4 airtime_fairness: on
# error: PROTO/1/2: batman-adv-4/unknown/unknown
# ip1: 192.168.254.1 ip2: 192.168.254.16 bytes: 44433328
# ip1: 192.168.254.1 ip2: 192.168.254.16 bytes: 21757952
# protocol: batman-adv-4 airtime_fairness: on
# error: PROTO/1/2: batman-adv-4/unknown/unknown
# ip1: 192.168.254.10 ip2: 192.168.254.12 bytes: 29622272
# ip1: 192.168.254.10 ip2: 192.168.254.12 bytes: 61948336
# protocol: batman-adv-4 airtime_fairness: on
# error: PROTO/1/2: batman-adv-4/unknown/unknown
# ip1: 192.168.254.13 ip2: 192.168.254.4 bytes: 10254736
# ip1: 192.168.254.13 ip2: 192.168.254.4 bytes: 3145728
# protocol: batman-adv-4 airtime_fairness: on
while read -r LINE; do
	set -- $LINE
	shift
	LINE="$*"

	case "$LINE" in
		'protocol:'*)
			MYLINE='first'
			set -- $LINE
			PROTOCOL="$2"
		;;
		'ip1:'*)
			[ "$MYLINE" = 'first' ] && {
				set -- $LINE
				BYTES1="$6"
				MYLINE='second'
			}

			[ "$MYLINE" = 'second' ] && {
				set -- $LINE
				BYTES2="$6"
				IP1="$2"
				IP2="$4"
				MYLINE=

				NODE1="$( echo "$IP1" | cut -d'.' -f4 )" 
				NODE2="$( echo "$IP2" | cut -d'.' -f4 )"

				echo "$NODE1,$NODE2,$BYTES1,$BYTES2"
			}
		;;
	esac
done <"$FILE"
