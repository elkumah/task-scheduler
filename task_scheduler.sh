#!/bin/bash

# check for common script errors
set -o nounset
set -o errexit

# Define the action variable
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

# Handle multiple actions and validate arguments
case "$ACTION" in
	add)
		if [[ "$#" -lt 4 ]]; then
			echo "Error: Add requires 4 arguments "
			usage
		fi

		echo "Shedule type:'$2', Schedule details: '$3'"

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


 
