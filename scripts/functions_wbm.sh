#!/bin/sh

log()
{
	logger -s -- "$0: $*"
}

uptime_in_seconds()
{
	cut -d'.' -f1 /proc/uptime
}

ping_ok()
{
	local ip="$1"
	local max=5
	local i=1

	while [ $i -lt $max ]; do {
		ping -c1 "$ip" >/dev/null 2>/dev/null && return 0
		i=$(( i + 1 ))
	} done

	return 1
}

convert_management2test_ip()
{
	local ip="$1"			# e.g. node 13 = 192.168.254.13
	local octet4="$( echo "$ip" | cut -d'.' -f4 )"

	echo "10.0.${octet4}.1"		# e.g. node 13 = 10.0.13.1
}

execute_command_via_ssh()
{
	local ip="$1"
	local mycommand="$2"		# can be a single command or a file

	log "sending command to $ip: $mycommand"

	# ssh will eat stdin, so a 'while read' breaks, we must use '-n'
	# see: https://stackoverflow.com/questions/9393038/ssh-breaks-out-of-while-loop-in-bash
	if [ -e "$mycommand" ]; then
		ssh -n \
		    -o ConnectTimeout=10 \
		    -o StrictHostKeyChecking=no \
		    -o UserKnownHostsFile=/dev/null \
			'ash -s'<"$mycommand"
	else
		ssh -n \
		    -o ConnectTimeout=10 \
		    -o StrictHostKeyChecking=no \
		    -o UserKnownHostsFile=/dev/null \
			root@$ip "$mycommand"
	fi

	if [ $? -eq 0 ]; then
		isnumber "$GOOD" && GOOD=$(( GOOD + 1 ))
		return 0
	else
		isnumber "$BAD" && BAD=$(( BAD + 1 ))
		return 1
	fi
}

isnumber(){ test 2>/dev/null ${1:-a} -eq "${1##*[!0-9-]*}";}

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
