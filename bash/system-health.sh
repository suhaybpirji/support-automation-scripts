#!/bin/bash
# system-health.sh
# Full system health check for Linux servers

echo "======================================"
echo "        SYSTEM HEALTH REPORT"
echo "======================================"
echo ""

echo "=== Uptime ==="
uptime
echo ""

echo "=== CPU Load ==="
top -bn1 | grep "Cpu(s)"
echo ""

echo "=== Memory Usage ==="
free -h
echo ""

echo "=== Disk Usage ==="
df -h | grep -E "Filesystem|/dev/"
echo ""

echo "=== Top 5 Processes by CPU ==="
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6
echo ""

echo "=== Top 5 Processes by Memory ==="
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%mem | head -n 6
echo ""

echo "=== Network Interfaces ==="
ip addr show
echo ""

echo "=== Default Route ==="
ip route show
echo ""

echo "=== Active Services (systemd) ==="
systemctl list-units --type=service --state=running | head -n 15
echo ""

echo "=== End of Report ==="

