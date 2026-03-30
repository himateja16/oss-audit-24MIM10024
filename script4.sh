#!/bin/bash
# Script 4: Log File Analyzer (Advanced)

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0
LINES=0

echo "====================================================="
echo "              Log File Analyzer"
echo "====================================================="

if [ -z "$LOGFILE" ]; then
    echo "Usage: ./script4.sh <logfile> [keyword]"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "File does not exist!"
    exit 1
fi

echo "Analyzing file: $LOGFILE"
echo "Searching for keyword: $KEYWORD"
echo "-----------------------------------------------------"

while IFS= read -r LINE
do
    LINES=$((LINES + 1))

    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Total lines scanned: $LINES"
echo "Keyword occurrences: $COUNT"

echo "-----------------------------------------------------"
echo "Last 10 matches:"
grep -i "$KEYWORD" "$LOGFILE" | tail -10

echo "====================================================="
echo "Analysis Completed"
echo "====================================================="
