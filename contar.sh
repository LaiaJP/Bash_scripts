#!/bin/bash

tot=60201

sed '1d' ${1} > temp1
awk '{print $1, $3}' temp1 > temp2
wat0=$(grep -c ' 0' temp2)
wat1=$(grep -c ' 1' temp2)
wat2=$(grep -c ' 2' temp2)
wat3=$(grep -c ' 3' temp2)
wat4=$(grep -c ' 4' temp2)
wat5=$(grep -c ' 5' temp2)
wat6=$(grep -c ' 6' temp2)
wat7=$(grep -c ' 7' temp2)
wat8=$(grep -c ' 8' temp2)

txc0=$(echo "scale=3;" $wat0"*100/"$tot | bc -l)
txc1=$(echo "scale=3;" $wat1"*100/"$tot | bc -l)
txc2=$(echo "scale=3;" $wat2"*100/"$tot | bc -l)
txc3=$(echo "scale=3;" $wat3"*100/"$tot | bc -l)
txc4=$(echo "scale=3;" $wat4"*100/"$tot | bc -l)
txc5=$(echo "scale=3;" $wat5"*100/"$tot | bc -l)
txc6=$(echo "scale=3;" $wat6"*100/"$tot | bc -l)
txc7=$(echo "scale=3;" $wat7"*100/"$tot | bc -l)
txc8=$(echo "scale=3;" $wat8"*100/"$tot | bc -l)


cat <<eof > ${1}_result
${txc1} ${txc2} ${txc3} ${txc4} ${txc5} ${txc6} ${txc7} ${txc8} 
eof

rm temp1 temp2
