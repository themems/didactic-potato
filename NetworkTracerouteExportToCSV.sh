#!/bin/bash
for i in $(seq 0 255); do
 for j in $(seq 0 255); do
 fping -c 1 -u 10.24.$i.$j >& /dev/null
  if [ $? -ne 0 ];
  then echo 10.24.$i.$j
  else
   mtr --csv -c 1 10.24.$i.$j > 10.24.$i.$j.csv
   cat 10.* >  resumen.csv
   rm 10.*
  fi
  done
done