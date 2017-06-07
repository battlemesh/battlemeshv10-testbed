#!/bin/ash
/etc/init.d/firewall disable
/etc/init.d/olsrd disable
/etc/init.d/olsrd2 disable
/etc/init.d/olsrd6 disable
/etc/init.d/batmand disable
/etc/init.d/bmx7 disable
/etc/init.d/babeld disable
/etc/init.d/olsrd stop
/etc/init.d/olsrd2 stop
/etc/init.d/olsrd6 stop
/etc/init.d/batmand stop
/etc/init.d/bmx7 stop
/etc/init.d/babeld stop
/etc/init.d/firewall stop
killall -q olsrd2
killall -q olsrd
killall -q babeld
killall -q bmx7