#!/bin/bash
# monitor-cpu.sh
# Shows real-time CPU usage using top and mpstat

echo "=== CPU Usage Summary ==="
mpstat 1 5

echo ""
echo "=== Top Processes by CPU ==="
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head
