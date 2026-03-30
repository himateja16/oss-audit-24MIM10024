#!/bin/bash
# Script 2: FOSS Package Inspector (Detailed Version)
# Author: M Hima Teja

PACKAGE="vlc"

echo "====================================================="
echo "         FOSS Package Inspector Tool"
echo "====================================================="
echo "Checking package: $PACKAGE"
echo "-----------------------------------------------------"

# Detect package manager
if command -v dpkg >/dev/null 2>&1; then
    PM="dpkg"
elif command -v rpm >/dev/null 2>&1; then
    PM="rpm"
else
    echo "No supported package manager found!"
    exit 1
fi

echo "Detected Package Manager: $PM"
echo "-----------------------------------------------------"

# Check installation
if [ "$PM" = "dpkg" ]; then
    if dpkg -l | grep -q "^ii  $PACKAGE"; then
        echo "$PACKAGE is installed."
        
        VERSION=$(dpkg -l | grep $PACKAGE | awk '{print $3}')
        ARCH=$(dpkg -l | grep $PACKAGE | awk '{print $4}')
        
        echo "Version       : $VERSION"
        echo "Architecture  : $ARCH"

        echo "-----------------------------------------------------"
        echo "Detailed Info:"
        apt show $PACKAGE 2>/dev/null | grep -E 'Package|Version|Maintainer|Homepage|Description'
    else
        echo "$PACKAGE is NOT installed."
    fi
else
    if rpm -q $PACKAGE &>/dev/null; then
        echo "$PACKAGE is installed."
        rpm -qi $PACKAGE
    else
        echo "$PACKAGE is NOT installed."
    fi
fi

echo "-----------------------------------------------------"

# Case explanation
case $PACKAGE in
    vlc)
        echo "VLC Media Player:"
        echo "- Open source multimedia player"
        echo "- Supports multiple formats"
        echo "- No need for extra codecs"
        ;;
    firefox)
        echo "Firefox: Open-source browser"
        ;;
    git)
        echo "Git: Version control system"
        ;;
    python)
        echo "Python: Programming language"
        ;;
    *)
        echo "Unknown package"
        ;;
esac

echo "====================================================="
echo "Inspection Completed"
echo "====================================================="
