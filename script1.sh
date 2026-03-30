#!/bin/bash
# Script 1: System Identity Report
# Author: M Hima Teja

STUDENT_NAME="M Hima Teja"
SOFTWARE_CHOICE="VLC Media Player"

# System Information
KERNEL=$(uname -r)
OS_NAME=$(uname -o)
HOSTNAME=$(hostname)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
DATE=$(date)

echo "=========================================="
echo "   Open Source Audit — $STUDENT_NAME"
echo "=========================================="
echo "Software Chosen : $SOFTWARE_CHOICE"
echo "------------------------------------------"
echo "Operating System : $OS_NAME"
echo "Kernel Version   : $KERNEL"
echo "Hostname         : $HOSTNAME"
echo "Current User     : $USER_NAME"
echo "Home Directory   : $HOME_DIR"
echo "System Uptime    : $UPTIME"
echo "Current Date     : $DATE"
echo "------------------------------------------"
echo "License Info     : GNU General Public License (GPL)"
echo "=========================================="
