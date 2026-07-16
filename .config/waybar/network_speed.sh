#!/bin/bash
# Script to get network rx/tx speed in MB/s with 2 decimal places and fixed layout padding

interface=$(ip route | grep '^default' | awk '{print $5}' | head -n1)
if [ -z "$interface" ]; then
    interface=$(ls /sys/class/net | grep -v lo | head -n1)
fi

r1=$(cat /sys/class/net/$interface/statistics/rx_bytes)
t1=$(cat /sys/class/net/$interface/statistics/tx_bytes)

sleep 1

r2=$(cat /sys/class/net/$interface/statistics/rx_bytes)
t2=$(cat /sys/class/net/$interface/statistics/tx_bytes)

rx_speed=$(awk -v r1="$r1" -v r2="$r2" 'BEGIN { printf "%5.2f", (r2 - r1) / 1048576 }')
tx_speed=$(awk -v t1="$t1" -v t2="$t2" 'BEGIN { printf "%5.2f", (t2 - t1) / 1048576 }')

echo "${rx_speed} ⬇ ${tx_speed} ⬆"
