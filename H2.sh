#!bin/bash

>/home/ChiefCommander/filedata.txt
>/home/ChiefCommander/distdata.txt
>/home/ChiefCommander/nearest10.txt

calc (){
 
 x1=$1
 y1=$2

 x=$(echo $x1 | awk -F "°" '{print $2}')
 y=$(echo $y1 | awk -F "°" '{print $2}')
 
  lat=28.7041
  lon=77.1025

  (awk -v x=$x -v y=$y -v lat=$lat -v lon=$lon '
  function asin(t){ 
   i=(sqrt(1-(t*t)))
   r=atan2(t,i)
   return r
   }

    function acos(t){
     i=(sqrt(1-(t*t)))
     return atan2(i,t) }

    function atan(t){ return atan2(t,1) }
    BEGIN{ 

    dLat=(x-lat)*3.14159/180.0
    dLon=(y-lon)*3.14159/180.0
  
    lat=((lat)*3.14159/180.0)
    x=((x)*3.14159/180.0)
  
    a=((sin(dLat/2))*(sin(dLat/2))+(sin(dLon/2))*(sin(dLon/2))*(cos(lat))*(cos(lat)))

    rad=6371
    
    p=sqrt(a)

    c=2*asin(p) 

    dist=(rad*c);
 
    print dist
}')
}

D=$(date "+%F")

join -1 2 -2 2 /root/attendance.log /root/position.log | awk -F " " '{print $1,$3,$4,$5,$6}' | grep Army.* | grep YES | sed -n "/2020-04-11/,/$D/p" >/home/ChiefCommander/filedata.txt

input="/home/ChiefCommander/filedata.txt"

while IFS= read -r line
do
 var1=$(echo "$line"|awk '{print $4}')
 var2=$(echo "$line"|awk '{print $5}')
 var3=$(echo $(calc "$var1" "$var2"))
 echo "$line $var3">>/home/ChiefCommander/distdata.txt
done < "$input"

cat /root/distdata.txt | sort +5n | awk '{print $1,$3}' | sed -n 1,10p >/home/ChiefCommander/nearest10.txt













