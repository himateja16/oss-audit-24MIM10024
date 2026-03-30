#!/bin/bash
# Script 3: Disk and Permission Auditor (Detailed)
# Author: M Hima Teja

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "====================================================="
echo "         Disk and Permission Auditor"
echo "====================================================="

TOTAL_SIZE=0

for DIR in "${DIRS[@]}"; do
    echo "Checking directory: $DIR"
    echo "-----------------------------------------------------"

    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld $DIR | awk '{print $1}')
        OWNER=$(ls -ld $DIR | awk '{print $3}')
        GROUP=$(ls -ld $DIR | awk '{print $4}')
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)

        echo "Permissions : $PERMS"
        echo "Owner       : $OWNER"
        echo "Group       : $GROUP"
        echo "Size        : $SIZE"

        echo "Top 3 largest files:"
        du -ah $DIR 2>/dev/null | sort -rh | head -3

    else
        echo "Directory does not exist"
    fi

    echo "-----------------------------------------------------"
done

echo "Checking VLC configuration..."
CONFIG_DIR="$HOME/.config/vlc"

if [ -d "$CONFIG_DIR" ]; then
    echo "VLC Config found at $CONFIG_DIR"
    ls -ld $CONFIG_DIR
else
    echo "VLC config not found"
fi

echo "====================================================="
echo "Audit Completed"
echo "====================================================="
