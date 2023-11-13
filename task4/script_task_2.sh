#! /bin/bash

kill_count=3

parent_pid=$(pgrep -f "script_task_1.sh")

child_pids=($(pgrep -P $parent_pid))

child_pids_count=${#child_pids[@]}
echo $child_pids_count


if [ $child_pids_count -ge $kill_count ]; then
	for ((i = $child_pids_count - 1; i >= $child_pids_count - $kill_count; i--));
	do
		pid_to_kill=${child_pids[i]}
		echo "terminated process with PID: $pid_to_kill"
		kill $pid_to_kill
	done
else
	echo "not enough processes to kill"
fi
