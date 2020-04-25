#!/bin/bash

user=$(whoami)
echo "Enter the day of previous week ,record <day of prev week>"

read r
n=$(echo $r | awk -F " " '{print $2}')
w=$(date "+%w")
t=$(expr 7 + $w - $n)

d=$(date --date="$t days ago")

if [ "$user" = "ArmyGeneral" ]
then
  cat /root/attendance.log | grep "Army.*" | grep $d
fi

if [ "$user" = "NavyMarshal" ]
then
  cat /root/attendance.log | grep "Navy.*" | grep $d
fi

if [ "$user" = "AirForceChief" ]
then
  cat /root/attendance.log | grep "Airforce.*" | grep $d
fi
