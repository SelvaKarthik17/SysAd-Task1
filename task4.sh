#!bin/bash

   if [ -f /home/ArmyGeneral/attendance_record.txt ]
   then 
       if [ -s /home/ArmyGeneral/attendance_record.txt ]
       then
       
       else
         echo Date Present | column -t -s " " >/home/ArmyGeneral/attendance_record.txt
       fi
    else
        echo Date Present | column -t -s " " >/home/ArmyGeneral/attendance_record.txt
    fi

   if [ -f /home/NavyMarshall/attendance_record.txt ]
   then 
       if [ -s /home/NavyMarshall/attendance_record.txt ]
       then
       
       else
         echo Date Present | column -t -s " " >/home/NavyMarshall/attendance_record.txt
       fi
    else
        echo Date Present | column -t -s " " >/home/NavyMarshall/attendance_record.txt
    fi
           
   if [ -f /home/AirForceChief/attendance_record.txt ]
   then 
       if [ -s /home/AirForceChief/attendance_record.txt ]
       then
       
       else
         echo Date Present | column -t -s " " >/home/AirForceChief/attendance_record.txt
       fi
    else
        echo Date Present | column -t -s " " >/home/AirForceChief/attendance_record.txt
    fi
    
x=1
  while [ $x -lt 51 ]
  do

    flag=$(cat /root/attendance.log | grep 'AirForceChief'$x' ' | grep $(date "+%F") | awk -F " " '{print $3}')
    if [ "$flag" = "YES" ]
    then
      echo $(date "+%F") 'Army'$x | column -t -s " " >>/home/AirForceChief/attendance_record.txt
    else
    fi
    
    flag=$(cat /root/attendance.log | grep 'Army'$x' ' | grep $(date "+%F") | awk -F " " '{print $3}')
    if [ "$flag" = "YES" ]
    then
      echo $(date "+%F") 'Army'$x | column -t -s " " >>/home/ArmyGeneral/attendance_record.txt
    else
    fi
    
    flag=$(cat /root/attendance.log | grep 'Navy'$x' ' | grep $(date "+%F") | awk -F " " '{print $3}')
    if [ "$flag" = "YES" ]
    then
      echo $(date "+%F") 'Army'$x | column -t -s " " >>/home/NavyMarshall/attendance_record.txt
    else
    fi
    
    x=$(expr $x + 1)

done    

   

           
