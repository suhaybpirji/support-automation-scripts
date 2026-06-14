#!/bin/bash
# monitor-logs.sh
# Shows the last 20 lines of syslog and then follows it in real time

LOGFILE="/var/log/syslog"

echo "=== Showing last 20 lines of $LOGFILE ==="
tail -n 20 $LOGFILE

echo ""
echo "=== Following log in real time (CTRL + C to stop) ==="
tail -f $LOGFILE
