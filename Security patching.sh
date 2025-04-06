#!/bin/bash

servers=(8.8.8.8 127.0.0.1)

threshold=100

for i in "${servers[@]}"
do

  ping_latency=$(ping -c 1 "$i" | grep 'time=' | awk 'BEGIN{ FS= "time="} {print $2}' | awk '{print $1}')

  if [ "$ping_latency" -gt "$threshold" ]
  then
      echo "Hight latency in server "$i" with time = "$ping_latency" "
  else
      echo "Normal latency in server "$i" with time = "$ping_latency""
  fi

done

