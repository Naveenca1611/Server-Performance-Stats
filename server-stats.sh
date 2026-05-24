#!/bin/bash


echo "=================================================================="
echo "SERVER PERFORMANCE STATISTICS"
echo "=================================================================="
echo ""

# OS Version & Hostname Details

echo "Hostname & OS Details"
echo "====================="
echo "Hostname  : $(hostname)"
echo "OS Version        : $(uname -o) $(uname -r)"
echo "Kernel Vesrion    : $(uname -v)"
echo "Uptime            : $(uptime -p)"
echo ""

# CPU USAGE

echo "CPU USAGE"
echo "========="
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')


echo "CPU Usage : $CPU us"
echo ""

# Memory Usage

echo "Memory_Usage"
echo "============"
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')

echo "Total Memory : ${MEM_TOTAL} MB"
echo "Used Memory : ${MEM_USED} MB"
echo "Free Memory : ${MEM_FREE} MB"
echo ""
#Disk Usage

echo "Disk_Usage"
echo "=========="
df -h --total | grep 'total' | awk '
{
    print "Total Disk : " $2
    print "Used Disk  : " $3
    print "Free Disk  : " $4
    print "Disk Usage : " $5
}'
echo ""

#TOP 5 PROCESS BY MEMORY USAGE

echo "Top 5 processes by MEMORY usage"
echo "==============================="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
echo ""

#TOP 5 PROCESS BY CPU USAGE
echo "Top 5 processes by CPU usage"
echo "============================"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo ""
