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

		# validate schedule type
		case "$schedule_type" in 
			hourly)
				if [[ ! "$schedule_time" =~ ^([0-5]?[0-9])$ ]]; then
					echo "Error: For hourly specify the miniutes(HH:MM) "
					exit 1
			         fi
				;;

			daily|weekly)
				 if [[ ! "$schedule_time" =~ ^([01][0-9]|2[0-3]):[0-5][0-9]$ ]]; then
					 echo "Error: Invalid time format: '$schedule_time'. Use HH:MM (24-hour)"
				          exit 1
				 fi
				 ;;
                        *)

			echo "Error: Invalid schedule type:'$schedule_type'. Valid schedule type should be Hourly, Daily, Weekly "
			exit 1

				;;
		esac
		
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


 
