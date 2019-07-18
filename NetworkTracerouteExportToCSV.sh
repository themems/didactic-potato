#!/bin/bash
for i in $(seq 0 255); do
 for j in $(seq 0 255); do
  for k in $(seq 0 255); do
   fping -c 1 -u 10.$i.$j.$k >& /dev/null
   if [ $? -ne 0 ];
   then echo 10.$i.$j.$k
   else
    mtr --csv -c 1 10.$i.$j.$k > 10.$i.$j.$k.csv
    cat 10.* >  resumen.csv
   fi
   done
 done
done
