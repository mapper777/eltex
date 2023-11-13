#! /bin/bash

parent_pid=$(pgrep -f "script_task_1.sh")

child_pids=($(pgrep -P $parent))

for pid in "${child_pids[@]}";
do
	echo "terminated process with PID: $pid_to_kill"
	kill $pid_to_kill
done

echo "terminated parent process with PID: $parent_pid"
kill $parent_pid
