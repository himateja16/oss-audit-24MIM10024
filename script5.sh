#!/bin/bash
# Script 5: Open Source Manifesto Generator (Advanced)

echo "====================================================="
echo "        Open Source Manifesto Generator"
echo "====================================================="

read -p "Enter your name: " NAME
read -p "Open-source tool you use daily: " TOOL
read -p "What does freedom mean to you: " FREEDOM
read -p "What would you like to build: " BUILD

DATE=$(date '+%d %B %Y')
FILE="manifesto_$NAME.txt"

echo "-----------------------------------------------------"

echo "On $DATE, I, $NAME, believe that open-source software plays a crucial role in shaping the future." > $FILE
echo "Tools like $TOOL represent the idea of $FREEDOM and open collaboration." >> $FILE
echo "I aim to contribute by building $BUILD and sharing it with the community." >> $FILE
echo "Open source encourages transparency, innovation, and collective growth." >> $FILE

echo "-----------------------------------------------------"
echo "Manifesto saved as $FILE"
echo "-----------------------------------------------------"

cat $FILE
