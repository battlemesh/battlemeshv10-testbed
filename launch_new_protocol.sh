#!/bin/bash
. scripts/functions_wbm.sh

FILE="${1:-./routers}"		# or even give list of IPs
PROTOCOL="$2"

case "$PROTOCOL" in
	babel|batman-adv|bmx7|olsr1|olsr2)
	;;
	*)
		log "Usage: $0 <ipfile or list of IPs> <protocol>"
		log "		ipfile defaults to '$FILE'"
		log "		protocol must be one of babel|batman-adv|bmx7|olsr1|olsr2"
		exit 1
	;;
esac

if [ -e "$FILE" ]; then
	log "using file '$FILE'"
	while read -r LINE; do LIST_IP="$LIST_IP $LINE"; done <"$FILE"
else
	log "using IP's: $1"
	for IP in $1; do LIST_IP="$LIST_IP $IP"; done
fi

for IP in $LIST_IP; do
	execute_command_via_ssh "$IP" "scripts/$PROTOCOL"

	if [ $? -eq 0 ]; then
		echo "protocol '$PROTOCOL' launched on $IP"
		echo "$PROTOCOL" >/tmp/MESHPROTO
	else
		log "error switching to '$PROTOCOL'"
	fi
done
