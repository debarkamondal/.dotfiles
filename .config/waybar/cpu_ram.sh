#!/bin/bash
# Script to get CPU and RAM usage percentage

cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print int(100 - $1)}')
mem_usage=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
echo "${cpu_usage}% | ${mem_usage}%"
