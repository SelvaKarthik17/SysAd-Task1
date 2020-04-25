#!bin/bash

if [ ! -f /home/ChiefCommander/attendance_report.txt ]
then 
  touch /home/ChiefCommander/attendance_report.txt
fi

cat /root/attendance.log | grep "Army.*">>/home/ChiefCommander/attendance_report.txt

cat /root/attendance.log | grep "Navy.*">>/home/ChiefCommander/attendance_report.txt

cat /root/attendance.log | grep "Airforce.*">>/home/ChiefCommander/attendance_report.txt
