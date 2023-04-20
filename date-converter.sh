#!/bin/bash
#University Of Bristol, Smart Internet Lab, 5GCLARITY-Project

#log file created by log saver script:
input="logs/31-march-wifi.csv"

#function to convert linux datetime to epoch with milisecond accuracy 
while IFS="," read -r rec_column1 rec_column2 rec_column3 rec_column4
do
epoch=$(date -d "$rec_column1" +%s%N)
  echo "$epoch"
#  echo "Quantity: $rec_column2"
#  echo "Price: $rec_column3"
#  echo "Value: $rec_column4"
#  echo ""
done < <(tail -n +1 $input)
