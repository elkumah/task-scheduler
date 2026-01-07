#!/bin/bash

# check for common script errors
set -o nounset
set -o errexit

# Define  required  variable
ACTION="${1:-}"


# How to use the script
usage() {
	echo "Below is how to use the script:"
	echo " $0 add <schedule_type> <schedule_detail> <command...>"
	echo " $0 list "
	echo " $0 remove <task_id>"
	exit 1
 } 

if [[ -z "$ACTION"  ]]; then
	echo "No action provided"
	# show how to use the script
	usage
  

fi

# Handle  actions and validate arguments, schedule type, schedule time
case "$ACTION" in
	add)
		if [[ "$#" -lt 4 ]]; then
			echo "Error: Add requires 4 arguments "
			echo "Example:$0 add daily 14:30 /path/to/command"
			usage
		fi

		schedule_type="$2"
		schedule_time="$3"
		command="${@:4}"

		# validate schedule type
		case "$schedule_type" in 

			hourly|daily|weekly)
				 if [[ ! "$schedule_time" =~ ^([01][0-9]|2[0-3]):[0-5][0-9]$ ]]; then
					 echo "Error: Invalid time format: '$schedule_time'. Use HH:MM (24-hour)"
				          exit 1
				 fi
				 ;;
                        *)

			echo "Error: Invalid schedule type:'$schedule_type'. Valid schedule type should be Hourly, Daily, Weekly "
			exit 1

			
		esac
			echo "Schedule type: $schedule_type"
			echo "Schedule time: $schedule_time"
			echo "Command: $command"
		
	    

	    # Write task record to file
	    # Specify the location of the file and directory name 
	    TASK_FILE="$HOME/.task_scheduler/tasks.db"

	    TASK_DIR="$(dirname "$TASK_FILE")"

	    mkdir -p "$TASK_DIR"

	    #generate task id using date
	    task_id="$(date +%s)"

	    status="enabled"
	# Create the task record

	    task_record="${task_id}|${status}|${schedule_type}|${schedule_time}|${command}"

	    echo "$task_record" >> "$TASK_FILE"

	    echo "Task added successfully. ID: ${task_id}"
		;;
	list)
		if [[ "$#" -ne 1 ]]; then
			echo "Error: list takes no argument"
			usage
		fi

		;;


	remove)
		if [[ "$#" -ne 2 ]]; then
			echo "Error: Remove takes 2 arguments"
			usage
		fi

		;;
	*)
		echo "Unknown action: '$ACTION' "
		
		;;
esac


 
