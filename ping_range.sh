#!/bin/bash

network="192.168.1"

total_steps=100



  	for host in {70..99}; do
		for ((step=1; step<=total_steps; step++)); do
      
    		# Perform the task for each step here

		ip="${network}.${host}"
                	
		ping -c 1 -w 1 "$ip" > /dev/null

		if [ $? -eq 0 ]; then      # following code to execute if the last command was successful
			echo "Ping to $ip successful."
                fi

		 # Calculate the percentage completion
    	   	 progress=$((step * 100 / total_steps))
         	 # Print the progress bar
    	   	 printf "Progress: [%-50s] %d%%\r" $(printf '#%.0s' {1..$((progress/2))}) "$progress"
    	   	 sleep 0.1
		done

		# Add a new line to separate the progress bar from the next command
		echo ""
 	

	done


		
