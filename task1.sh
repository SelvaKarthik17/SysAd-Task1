#!/bin/bash

groupadd Army
groupadd Navy
groupadd AirForce
groupadd Commander

useradd ChiefCommander -m -s /bin/bash -g Army -G Navy -p $(openssl passwd -1 ChiefCommander)
usermod ChiefCommander -a -G AirForce
usermod ChiefCommander -a -G Commander

useradd ArmyGeneral -m -s /bin/bash -g Army -p $(openssl passwd -1 ArmyGeneral)
useradd NavyMarshal -m -s /bin/bash -g Navy -p $(openssl passwd -1 NavyMarshal)
useradd AirForceChief -m -s /bin/bash -g AirForce -p $(openssl passwd -1 AirForceChief)

a=1

while [ $a -lt 51 ]
do
   useradd Army$a -m -s /bin/bash -p $(openssl passwd -1 Army$a)
   useradd Navy$a -m -s /bin/bash -p $(openssl passwd -1 Navy$a)
   useradd Airforce$a -m -s /bin/bash -p $(openssl passwd -1 Airforce$a)

   a=$(expr $a + 1)
done



