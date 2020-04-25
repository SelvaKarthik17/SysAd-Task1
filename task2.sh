#!bin/bash

x=1

while [ $x -lt 51 ]
do
   chgrp Army /home/Army$x
   chmod g+rwx /home/Army$x

   chgrp Navy /home/Navy$x
   chmod g+rwx /home/Navy$x
   
   chgrp AirForce /home/Airforce$x
   chmod g+rwx /home/Airforce$x
   x=$(expr $x + 1)
done

 chgrp Commander /home/ArmyGeneral
 chmod g+rwx /home/ArmyGeneral

 chgrp Commander /home/NavyMarshal
 chmod g+rwx /home/NavyMarshal

 chgrp Commander /home/AirForceChief
 chmod g+rwx /home/AirForceChief
