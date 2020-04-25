#!bin/bash

x=1

while [ $x -lt 51 ]
do
 if [ ! -f /home/Army$x/post_alloted.txt ] 
 then
   echo Date Post | column -t -s " " >/home/Army$x/post_alloted.txt
 fi

 if [ ! -f /home/Navy$x/post_alloted.txt ]
 then
   echo Date Post | column -t -s " " >/home/Navy$x/post_alloted.txt
 fi

 if [ ! -f /home/AirForce$x/post_alloted.txt ]
 then
   echo Date Post | column -t -s " " >/home/AirForce$x/post_alloted.txt
 fi  

 x=$(expr $x + 1)
done


x=1
while [ $x -lt 51 ]
do
    place=$(cat /root/position.log | grep 'Army'$x' ' | grep $(date "+%F") | awk -F " " '{print $3 $4}')
    echo $(date "+%F") $place | column -t -s " " >>/home/Army$x/post_alloted.txt
    
    place=$(cat /root/position.log | grep 'Navy'$x' ' | grep $(date "+%F") | awk -F " " '{print $3 $4}')
    echo $(date "+%F") $place | column -t -s " " >>/home/Navy$x/post_alloted.txt
 
    place=$(cat /root/position.log | grep 'AirForce'$x' ' | grep $(date "+%F") | awk -F " " '{print $3 $4}')
    echo $(date "+%F") $place | column -t -s " " >>/home/AirForce$x/post_alloted.txt

    x=$(expr $x + 1)
done

