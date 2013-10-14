#!/bin/bash
tar -cf backup.tar test
file=$(find /home -user os155 ! -path '/proc*' ! -name '.*' -mmin -60)
for i in $file 
do
   echo $i
   a=$(ls -l $i|grep 'os155'|awk -F ' ' '{print$3}') 
   if [[ $a == 'os155' ]];
    then
      echo $i
      tar -rf backup.tar $i
    
   fi
done





