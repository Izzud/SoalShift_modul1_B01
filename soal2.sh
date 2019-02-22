#!/bin/bash

echo "(a)"
awk -F ',' '{if($7=="2012")i[$1]+=$10} END {for (x in i) print i[x] " "x}' WA_Sales_Products_2012-14.csv|sort -nr|head -1

echo "(b)"
awk -F ',' '{if($7=="2012" && $1=="United States")i[$4]+=$10} END {for (x in i) print i[x] " "x}' WA_Sales_Products_2012-14.csv|sort -nr|head -3

echo "(c)"
awk -F ',' '{if($7=="2012" && $1=="United States" && ($4=="Personal Accessories" || $4=="Camping Equipment" || $4=="Outdoor Protection")i[$6]+=$10} END {for (x in i) print i[x] " "x}' WA_Sales_Products_2012-14.csv|sort -nr|head -3
