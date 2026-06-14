#!/bin/bash
# network-diagnostics.sh
# Performs basic network troubleshooting checks

TARGET="8.8.8.8"

echo "=== Checking connectivity to $TARGET ==="
ping -c 4 $TARGET

echo ""
echo "=== DNS Resolution Test ==="
nslookup google.com

echo ""
echo "=== IP Address Information ==="
ip addr show

echo ""
echo "=== Default Route ==="
ip route show

echo ""
echo "=== Active Network Connections ==="
ss -tulnp
