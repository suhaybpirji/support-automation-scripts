#!/bin/bash
# check-disk.sh
# Shows disk usage in a human-readable format

echo "=== Disk Usage (df -h) ==="
df -h | grep -E "Filesystem|/dev/"
