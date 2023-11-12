#! /bin/bash


processes_number=5

# запуск дочерних процессов
for ((i=1; i<=$processes_number; i++)); 
do
	sleep $i &
done

wait

echo "number of completed processes: $processes_number" > processes_count.txt

sleep 3600
