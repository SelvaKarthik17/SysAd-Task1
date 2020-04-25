#!bin/sh

chmod +x /root/task1.sh
chmod +x /root/task2.sh
chmod +x /root/task3.sh
chmod +x /root/task4.sh
chmod +x /root/task5.sh
chmod +x /root/H1.sh

alias userGenerate="./root/task1.sh"
userGenerate

alias permit="./root/task2.sh"
permit

alias autoSchedule="./root/task3.sh"
echo "0 0 * * * autoSchedule" | crontab -

alias attendance="./root/task4.sh"
echo "0 6 * * * attendance" | crontab -

alias record="./root/task5.sh"
record

alias finalattendance="./root/H1.sh"
finalattendance



