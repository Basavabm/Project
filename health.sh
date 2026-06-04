#!/bin/bash

echo "================================="
echo "      SYSTEM HEALTH CHECK"
echo "================================="
echo

echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "Uptime:"
uptime -p
echo

echo "---------------------------------"
echo "CPU Load"
echo "---------------------------------"
uptime | awk -F'load average:' '{print $2}'
echo

echo "---------------------------------"
echo "Memory Usage"
echo "---------------------------------"
free -h
echo

echo "---------------------------------"
echo "Disk Usage"
echo "---------------------------------"
df -h
echo

echo "---------------------------------"
echo "Top 5 Memory Consuming Processes"
echo "---------------------------------"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
echo

echo "---------------------------------"
echo "Top 5 CPU Consuming Processes"
echo "---------------------------------"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo

echo "---------------------------------"
echo "Logged-in Users"
echo "---------------------------------"
who
echo

echo "---------------------------------"
echo "Network Connectivity"
echo "---------------------------------"
ping -c 2 google.com >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Internet Connectivity: OK"
else
    echo "Internet Connectivity: FAILED"
fi

echo
echo "================================="
echo "   HEALTH CHECK COMPLETED"
echo "================================="
